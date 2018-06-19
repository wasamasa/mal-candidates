module iso_readline
  implicit none
  private
  public :: readline, add_history

  interface
     subroutine Freadline(prompt, buf, buf_size, line_size) bind(c, name='Freadline')
       use iso_c_binding
       character(kind=c_char), intent(in) :: prompt(*)
       character(kind=c_char), intent(out) :: buf(*)
       integer(kind=c_int), intent(in), value :: buf_size
       integer(kind=c_int), intent(out) :: line_size
     end subroutine Freadline
  end interface

  interface
     subroutine Fadd_history(line) bind(c, name='add_history')
       use iso_c_binding
       character(kind=c_char), intent(in) :: line(*)
     end subroutine Fadd_history
  end interface
contains
  subroutine readline(prompt, buf, length)
    use iso_c_binding
    character(*, kind=c_char), intent(in) :: prompt
    character(*, kind=c_char), intent(out) :: buf
    integer(kind=c_int), intent(out) :: length
    call Freadline(prompt // C_NULL_CHAR, buf, len(buf), length)
  end subroutine readline

  subroutine add_history(line)
    use iso_c_binding
    character(*, kind=c_char), intent(in) :: line
    call Fadd_history(line // C_NULL_CHAR)
  end subroutine add_history
end module iso_readline
