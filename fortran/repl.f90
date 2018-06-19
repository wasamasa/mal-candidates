program repl
  implicit none
  character(len=256) :: buf
  integer :: length
  character(:), allocatable :: history_file
  character(*), parameter :: path = '/.mal_history'
  character(*), parameter :: space_chars = " 	" // new_line('')
  call get_environment_variable('HOME', buf, length)
  allocate(character(length + len(path)) :: history_file)
  history_file = buf(:length) // path
  call main('> ')
contains
  subroutine load_history()
    use, intrinsic :: iso_fortran_env
    use iso_readline
    character(len=256) :: line
    integer :: unit, size, iostat
    open(newunit=unit, file=history_file, action='read', &
         iostat=iostat, form='formatted', access='stream')
    if (iostat > 0) return
    do
       read(unit, '(a)', advance='no', iostat=iostat, size=size) line
       if (iostat == IOSTAT_END) exit
       call add_history(line(:size))
    end do
    close(unit)
  end subroutine load_history

  logical function is_blank(string)
    character(*), intent(in) :: string
    is_blank = verify(string, space_chars) == 0
  end function is_blank

  subroutine append_line(path, line)
    character(*), intent(in) :: path, line
    integer :: unit
    open(newunit=unit, file=path, action='write', &
         position='append', form='formatted', access='stream')
    write(unit, '(a)') line
    close(unit)
  end subroutine append_line

  subroutine add_to_history(line)
    use iso_readline
    character(*), intent(in) :: line
    if (.not. is_blank(line)) then
       call add_history(line)
       call append_line(history_file, line)
    end if
  end subroutine add_to_history

  subroutine main(prompt)
    use iso_readline
    character(*), intent(in) :: prompt
    character(len=256) :: line
    integer :: length
    call load_history()
    do while (.true.)
       call readline(prompt, line, length)
       if (length < 0) exit
       if (.not. is_blank(line(:length))) then
          write(*, '(g0)') line(:length)
          call add_to_history(line(:length))
       end if
    end do
    write(*, '(g0)') ''
  end subroutine main
end program repl
