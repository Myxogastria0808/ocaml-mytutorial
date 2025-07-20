let rec sum (n : int) (result : int) : int =
  if n = 0 then result else sum (n - 1) (result + n)
;;

print_endline (string_of_int (sum 9 0))
