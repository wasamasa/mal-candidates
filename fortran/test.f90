program test
  use, intrinsic :: iso_fortran_env
  use util
  implicit none
  real(kind=real64) :: then_
  class(Cell), pointer :: dict
  type(Rect) :: r1
  then_ = now()
  r1 = Rect(6)
  dict => cons(cons(make_lisp_text("foo"), make_lisp_text("1")), &
          cons(cons(make_lisp_text("bar"), make_lisp_text("2")), nil()))
  write(*, '(g0)') 'Reading words...'
  write(*, '(g0)', advance='no') 'Words: '
  call print_text_list(read_words('> '))
  write(*, '(g0)') ''
  write(*, '(*(g0))') 'The answer: ', the_answer()
  ! no closures
  write(*, '(*(g0))') 'Hostname: ', hostname()
  write(*, '(g0)', advance='no') 'ARGV: '
  call print_text_list(argv())
  write(*, '(g0)') ''
  ! no exception handling
  ! no varargs
  write(*, '(g0)', advance='no') 'Tokens: '
  call print_text_list(tokenize('1 * (2 * 3) + 4'))
  write(*, '(g0)') ''
  write(*, '(g0)', advance='no') 'Keys: '
  call print_text_list(keys(dict))
  write(*, '(g0)') ''
  write(*, '(*(g0))') 'Rect r1 size: ', r1%size
  write(*, '(*(g0))') 'Doubling rect size...'
  r1%size = r1%size * 2
  write(*, '(*(g0))') 'Rect r1 size: ', r1%size
  write(*, '((g0),(f4.2),(g0))') 'Elapsed time: ', now() - then_, 'ms'
end program test
