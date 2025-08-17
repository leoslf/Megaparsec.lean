instance [BEq e] [BEq a] : BEq (Except e a) where
  beq
  | .error a, .error b => a == b
  | .ok a, .ok b => a == b
  | _, _ => false

