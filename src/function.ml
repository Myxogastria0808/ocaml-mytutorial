(*** 高階関数 ***)
(*
  参考サイト
  - https://www.fos.kuis.kyoto-u.ac.jp/~igarashi/class/isle4-02w/mltext/ocaml005.html
*)
(* 関数を引数にとる関数、または関数を返す関数のこと *)

(* 例: 1^2 + 2^2 + 3^2 + ... *)
let rec square_sum n = if n = 0 then 0 else (n * n) + square_sum (n - 1)

(* 例: 1^3 + 2^3 + 3^3 + ... *)
let rec cube_sum n = if n = 0 then 0 else (n * n * n) + cube_sum (n - 1)

(*
  ここで、平方和を計算する関数と立法和を計算する関数
  の共通化をしたsigmaを作成する
*)
(*** 補助関数 ***)
(* このsigma内に存在する f が補助関数である。 *)
let rec sigma ((f : int -> int), (n : int)) =
  if n = 0 then 0
  else
    (* f という関数にnを渡したときの結果 + sigma f (n - 1) *)
    f n + sigma (f, n - 1)

(* sigmaの定義により、以下のようなことが可能になる *)
let square_result =
  let square x = x * x in
  sigma (square, 3)
;;

print_endline (string_of_int square_result)

let cube_result =
  let cube x = x * x * x in
  sigma (cube, 3)
;;

print_endline (string_of_int cube_result)

(*** 匿名関数 (ラムダ計算におけるラムダ式) ***)
(*
  func <pattern> -> e
  patternで表される引数を受け取り式 e を計算する
*)
(*
  - ラムダ計算
  λx. x * x
  - OCamlの匿名関数
  fun x -> x * x
*)
(* さらに、匿名関数を利用することで以下のように表現できる *)
(* n という引数を取る sq_sum という高階関数を定義 *)
let sq_sum n = sigma ((fun x -> x * x), n);;

(*
  - ベータ簡約
  匿名関数 (以下は、匿名関数ではないが) に具体的な値を適用すること。

  - ラムダ計算
  λx. x * x
  - OCamlの匿名関数
  fun x -> x * x
  - ベータ簡約
  (fun x -> x * x) 3
*)
print_endline (string_of_int (sq_sum 3))

(* m という引数を取る cb_sum という高階関数を定義 *)
let cb_sum m = sigma ((fun x -> x * x * x), m);;

print_endline (string_of_int (cb_sum 3))

(*** カリー化 ***)
(*
  OCamlの関数は全て1引数である。
  そのため、複数の引数を取る関数は、
  組を引数として持つか関数を返す関数として表現する。
  そして、関数を返す関数をカリー化関数と呼ぶ。
*)

(*
  - 基本的なアイデア
  「xとyを受け取りeを計算する関数」を
  「xを受け取ると、『yを受け取ってeを計算する関数』を返す関数」
  として表現する。
*)
let add_curry x = fun y -> x + y;;

print_endline (string_of_int (add_curry 3 4))

(* カリー化関数を使うことで、部分適用が可能になる *)
(* add_five y というyを受けとって5 + yを計算する関数になる *)
let add_five = add_curry 5;;

(* add_fiveは、5 + yという関数になっている *)
print_endline (string_of_int (add_five 10))
