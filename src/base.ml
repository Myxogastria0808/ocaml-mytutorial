(*** 基本的なデータ型 ***)
(* int型 *)
let ex1: int = 0 ;;
print_endline ("ex1: " ^ string_of_int ex1);;
(*四則演算の記号: + - * / mod *)
let ex1_plus: int = ex1 + 1 ;;
print_endline ("ex1_plus: " ^ string_of_int ex1_plus);;


(* float型 *)
let ex2: float = 0.0 ;;
print_endline ("ex2: " ^ string_of_float ex2);;
(*四則演算の記号: +. -. *. /. *)
(* 四則演算の記号がint型と異なる *)
let ex2_plus: float = ex2 +. 1.0 ;;
print_endline ("ex2_plus: " ^ string_of_float ex2_plus);;

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
  else begin
    print_endline (string_of_int n) ;
    (* 再帰呼び出し *)
    countdown (n - 1) ;
  end ;;

(* 再帰関数の実行 *)
countdown 10 ;;

(* let in *)
(* let ... in ... は、局所変数 (局所的な束縛) を定義するための構文 *)
(* let 変数 = 式 in 式 *)
let ex8: unit =
  let x = 10 in
  let y = x * x in
  (* x と y はこの let ... in のスコープ内でのみ有効 *)
  print_endline ("x: " ^ string_of_int x) ;
  print_endline ("y: " ^ string_of_int y) ;
  (* x と y を使った計算 *)
  let result = x + y in
  print_endline ("result: " ^ string_of_int result) ;;

(*** セミコロンについて ***)
(* セミコロンは、式を順に評価する演算子である。 *)
(* セミコロンの左側の関数が評価された後、右側の関数が評価される。 *)
(* unitを返す式に対してのみ利用可能 *)
(* unit を返す式に対してセミコロンを使うのは、副作用の順番を保証するため *)
(* 参考: https://tnomura9.exblog.jp/28186738/ *)
let ex9: int =
  let x = 1 in
  let y = 2 in
  (* セミコロンで区切られた式は、左から右へ評価される *)
  print_endline ("x: " ^ string_of_int x) ;
  print_endline ("y: " ^ string_of_int y) ;
  (* ;; は、式や定義の終わりを示す *)
  (* REPL環境などで式の終了を知らせるために利用される *)
  (* mlファイルに書くときは、書かなくても良い *)
  x + y ;;

(* ex9の実行 *)
print_endline ("ex9: " ^ string_of_int ex9) ;;

(*** 文と式について ***)
(* 式 ... 値を返すもので、変数に代入できる *)
(* 文 ... 値を返さないもので、変数に代入できない *)
(* OCamlは「すべてが式」という設計思想を持つ *)
(* 実際にfor文もあるが、利用は非推奨である。 *)
(* 副作用のみを目的とする文は、unit型を返すことによって、事実上の文として扱われる。*)
(* 例: print_endlineは副作用のみを目的とする文であり、unit型を返す *)

(** 条件式 **)
let ex10: string =
  let x = 10 in
    if x > 0 then
      "Positive"
    else if x < 0 then
      "Negative"
    else
      "Zero" ;;

(* ex10の実行 *)
print_endline ("ex10: " ^ ex10) ;;

(** パターンマッチ **)
let ex11: string =
  let x = 10 in
    match x with
    | 0 -> "Zero"
    | n when n > 0 -> "Positive"
    | _ -> "Negative" ;;

(* ex11の実行 *)
print_endline ("ex11: " ^ ex11) ;;

(** 組 **)
(* 組は、複数の値を並べてひとつのデータにしたもので、違う型を許容する *)
let ex12: int * string = (42, "Hello") ;;
(* 組の要素にアクセスするには、fstとsndを使用 *)
let first: int = fst ex12 ;;
let second: string = snd ex12 ;;
print_endline ("ex12: " ^ string_of_int first ^ ", " ^ second)

(** レコード **)
(* レコードは、名前付きフィールドを持つデータ型で、複数の値をまとめることができる *)
(* レコードを利用するために、まず型定義をする必要がある。 *)
type person_t = {
  name: string;
  age: int;
} ;;

(* レコードのインスタンスを作成 *)
let ex13: person_t = { name = "Alice"; age = 30 } ;;
(* レコードのフィールドにアクセスするには、ドット記法を使用 *)
let name: string = ex13.name ;;
let age: int = ex13.age ;;
print_endline ("ex13: " ^ name ^ ", " ^ string_of_int age) ;;

(** リスト **)
(* リストは、同じ型の値を並べたデータ構造 *)
(* リストは空リスト [] と、要素と残りのリストを組み合わせた :: 演算子で構成される *)
(* 定義パターン1 *)
let ex14: int list = [1; 2; 3; 4; 5] ;;
(* 定義パターン2 *)
let ex15: int list = 1 :: 2 :: 3 :: 4 :: 5 :: [] ;;
(* リストの長さは List.length を使用 *)
let ex14_length: int = List.length ex14 ;;
let ex15_length: int = List.length ex15 ;;
print_endline ("ex14_length: " ^ string_of_int ex14_length) ;;
print_endline ("ex15_length: " ^ string_of_int ex15_length) ;;

(* リストの要素にアクセスするには、パターンマッチを使用 *)
let rec print_list (lst: int list) : unit =
  match lst with
  | [] -> ()
  (* 現在の先頭要素 :: 残りのリスト *)
  (* 再帰的にこの定義をすることで、全ての要素を取得できる *)
  | head :: remains ->
      print_endline (string_of_int head) ;
      print_list remains ;;
(* 上記の関数の挙動 *)
(*
  1.  1 :: [2; 3; 4; 5]
  2.  2 :: [3; 4; 5]
  3.  3 :: [4; 5]
  4.  4 :: [5]
  5.  5 :: []
  6.  [] -> ()
*)


(* リストの要素を出力 *)
print_list ex14 ;;
print_list ex15 ;;

(** 補助関数 (helper関数) *)
