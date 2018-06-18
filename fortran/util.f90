module util
  use, intrinsic :: iso_fortran_env
  implicit none
  private
  public :: nil, make_lisp_text, car, cdr, cons, reverse_list, print_text_list
  public :: read_words, the_answer, hostname, argv, tokenize, keys, now
  type, public :: Rect
     integer :: size
  end type Rect

  type, public :: Cell
     class(Cell), pointer :: ar => null()
     class(Cell), pointer :: dr => null()
  end type Cell
  type, extends(Cell), public :: LispText
     character(:), allocatable :: s
  end type LispText

  character(*), parameter :: space_chars = " 	" // new_line('')
  character(*), parameter :: special_chars = "+-*/()"
  character(*), parameter :: digit_chars = "0123456789"
contains
  function nil() result(c)
    class(Cell), pointer :: c
    allocate(c)
  end function nil

  function make_lisp_text(s) result(c)
    character(*), intent(in) :: s
    class(Cell), pointer :: c
    class(LispText), pointer :: t
    allocate(c)
    allocate(t)
    t%s = s
    c => t
  end function make_lisp_text

  function is_pair(x) result(b)
    class(Cell), pointer, intent(in) :: x
    logical :: b
    b = associated(x) .and. associated(car(x)) .and. associated(cdr(x))
  end function is_pair

  function car(list) result(c)
    class(Cell), pointer, intent(in) :: list
    class(Cell), pointer :: c
    c => list%ar
  end function car

  function cdr(list) result(c)
    class(Cell), pointer, intent(in) :: list
    class(Cell), pointer :: c
    c => list%dr
  end function cdr

  function cons(x, y) result(c)
    class(Cell), pointer, intent(in) :: x, y
    class(Cell), pointer :: c
    allocate(c)
    c%ar => x
    c%dr => y
  end function cons

  function reverse_list(list) result(c)
    class(Cell), pointer, intent(in) :: list
    class(Cell), pointer :: tmp, c
    tmp => list
    c => nil()
    do while (is_pair(tmp))
       c => cons(car(tmp), c)
       tmp => cdr(tmp)
    end do
  end function reverse_list

  subroutine print_text_list(list)
    class(Cell), pointer, intent(in) :: list
    class(Cell), pointer :: tmp, item
    logical :: printsp
    printsp = .false.
    tmp => list
    write(*, '(a)', advance='no') '('
    do while (is_pair(tmp))
       if (printsp) then
          write(*, '(a)', advance='no') ', '
       endif
       item => car(tmp)
       select type(item)
       type is(LispText)
          write(*, '(*(g0))', advance='no') '"', item%s, '"'
       class default
          stop 'non-text item'
       end select
       printsp = .true.
       tmp => cdr(tmp)
    end do
    write(*, '(a)', advance='no') ')'
  end subroutine print_text_list

  subroutine read_word(prompt, buffer, size, iostat)
    character(*), intent(in) :: prompt
    character(*), intent(out) :: buffer
    integer, intent(out) :: size, iostat
    write(*, '(g0)', advance='no') prompt
    read(*, '(a)', advance='no', size=size, iostat=iostat) buffer
  end subroutine read_word

  function read_words(prompt) result(words)
    character(*), intent(in) :: prompt
    class(Cell), pointer :: words
    character(len=256) :: word
    integer :: size, iostat
    allocate(words)
    do
       call read_word(prompt, word, size, iostat)
       if (iostat == IOSTAT_END) exit
       words => cons(make_lisp_text(word(:size)), words)
    end do
    words => reverse_list(words)
  end function read_words

  function the_answer() result(n)
    integer :: n
    n = 1**2 + 4**2 + 5**2
  end function the_answer

  function hostname() result(s)
    integer :: unit, size
    character(:), allocatable :: s
    open(newunit=unit, file='/etc/hostname', action='read', &
         form='unformatted', access='stream')
    inquire(unit=unit, size=size)
    ! HACK: writing a chomp function would be a pain
    allocate(character(size - 1) :: s)
    read(unit) s
    close(unit)
  end function hostname

  function argv() result(args)
    class(Cell), pointer :: args
    integer :: i, argc, length
    character(len=255) :: command
    args => nil()
    argc = command_argument_count()
    do i = 1, argc
       call get_command_argument(i, command, length)
       args => cons(make_lisp_text(command(:length)), args)
    end do
    args => reverse_list(args)
  end function argv

  function read_chars(input, i, chars) result(j)
    character(*), intent(in) :: input, chars
    integer, intent(in) :: i
    integer :: j, size
    j = i
    size = len(input)
    do while ((j <= size) .and. index(chars, input(j:j)) > 0)
       j = j + 1
    end do
  end function read_chars

  function tokenize(input) result(tokens)
    character(*), intent(in) :: input
    character(len=1) :: ch
    integer :: size, i, from
    class(Cell), pointer :: tokens
    i = 1
    tokens => nil()
    size = len(input)
    do while (i <= size)
       ch = input(i:i)
       if (index(space_chars, ch) > 0) then
          i = read_chars(input, i, space_chars)
       else if (index(digit_chars, ch) > 0) then
          from = i
          i = read_chars(input, i, digit_chars)
          tokens => cons(make_lisp_text(input(from:i-1)), tokens)
       else if (index(special_chars, ch) > 0) then
          from = i
          i = i + 1
          tokens => cons(make_lisp_text(input(from:i-1)), tokens)
       end if
    end do
    tokens => reverse_list(tokens)
  end function tokenize

  function keys(dict) result(items)
    class(Cell), pointer, intent(in) :: dict
    class(Cell), pointer :: tmp, items
    tmp => dict
    items => nil()
    do while (is_pair(tmp))
       items => cons(car(car(tmp)), items)
       tmp => cdr(tmp)
    end do
    items => reverse_list(items)
  end function keys

  function now() result(elapsed)
    real(real64) :: elapsed
    integer(int64) :: count, count_rate, count_max
    call system_clock(count, count_rate, count_max)
    elapsed = (real(count, real64) / real(count_rate, real64)) * 1000.
  end function now
end module util
