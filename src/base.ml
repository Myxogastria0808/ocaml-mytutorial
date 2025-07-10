(*** 基本的なデータ型 ***)
(* int型 *)
let ex1: int = 0 ;;
print_endline ("ex1" ^ string_of_int ex1);;
(*四則演算の記号: + - * / mod *)
let ex1_plus: int = ex1 + 1 ;;
print_endline ("ex1_plus" ^ string_of_int ex1_plus);;


(* float型 *)
let ex2: float = 0.0 ;;
print_endline ("ex2" ^ string_of_float ex2);;
(*四則演算の記号: +. -. *. /. *)
(* 四則演算の記号がint型と異なる *)
let ex2_plus: float = ex2 +. 1.0 ;;
print_endline ("ex2_plus" ^ string_of_float ex2_plus);;

(* string型 *)
let ex3: string = "Hello, OCaml!" ;;
print_endline ("ex3: " ^ ex3);;
(* 文字列の長さは String.length を使用 *)
let ex3_length: int = String.length ex3 ;;
print_endline ("ex3_length: " ^ string_of_int ex3_length);;
(* 文字列の連結は ^ を使用 *)
let ex4: string = "Hello, " ^ "OCaml!" ;;
print_endline ("ex4: " ^ ex4);;

(* bool型 *)
let ex5: bool = true ;;
print_endline ("ex5: " ^ string_of_bool ex5);;

(* char型*)
let ex6: char = 'a' ;;
print_endline ("ex6: " ^ String.make 1 ex6);;

(* unit型 *)
(* unit型は値が () のみで、関数の戻り値などに使用される *)
let ex7: unit = () ;;
print_endline ("ex7: " ^ string_of_unit ex7);;

(* 関数の定義 *)
let add (x: int) (y: int) :int =
  x + y ;;

(* 関数の呼び出し *)
let result: int = add 3 4 ;;
print_endline ("result: " ^ string_of_int result);;

(* 再帰関数の定義 *)
let rec countdown (n: int) :unit =
  if n <= 0 then
    print_endline "finish!"
  else
    print_endline (string_of_int n)
    (* 再帰呼び出し *)
    countdown (n - 1);;

(* 再帰関数の実行 *)
countdown 10 ;;
