#!/usr/bin/env dyalogscript

⍝⍝⍝ Generate workspace with the following definitions.
⍝
⍝ Usage: ./dws-gen [workspace filename]
⍝
⍝ WORKSPACE FILENAME defaults to 'ALE.dws'.
⍝

       E ← {∆f∘←0⊣of←∆f ⋄ 0≠e ⍵:∆f∘←of ⋄ _←0}
       G ← {⍺←1,≢∆ ⋄ ⍺{_←p ⍵ ⋄ eval⍞}g ⍵}
       V ← {⍺←1,≢∆ ⋄ ⍺{_←p ⍵ ⋄ eval⍞}v ⍵}
       W ← {⍺←1,≢∆ ⋄ 0≠c←chkrange ⍺:_←c ⋄ ⎕←∆[rngidx ⍺]∆e ∆nl ⎕NPUT ⍵ 2 ⋄ ∆f∘←0 ⋄ ⍙∘←(''≡⍙)⊃⍙ ⍵ ⋄ _←0}
      _r ← {∆p∘←p←⍵ ∆p⊃⍨⍵≡'' ⋄ 0=≢z←1+p ⎕S 2⊢∆:4 perr ¯1 ⋄ 0=+⌿m←z<_:⊃⌽z ⋄ ⊃⌽m⌿z}
      _s ← {∆p∘←p←⍵ ∆p⊃⍨⍵≡'' ⋄ 0=≢z←1+p ⎕S 2⊢∆:4 perr ¯1 ⋄ 0=+⌿m←z>_:⊃z ⋄ ⊃m⌿z}
       a ← {0≠c←chkline ⍵:_←c ⋄ d←input ⋄ ∆∆∘←∆ ⋄ ∆∘←(⍵↑∆),d,⍵↓∆ ⋄ ∆f∘←1 ⋄ __∘←_ ⋄ _∘←⍵+≢d ⋄ _←0}
       c ← {0≠c←chkrange ⍵:_←c ⋄ d←input ⋄ s e←2⍴⍵ ⋄ ∆∆∘←∆ ⋄ ∆∘←(∆↑⍨s-1),d,e↓∆ ⋄ ∆f∘←1 ⋄ __∘←_ ⋄ _∘←(s-1)+≢d ⋄ _←0}
 chkline ← {⍺←0 ⋄ ⍬≢⍴⍵:0 perr 4 ⋄ (⍵≥⍺)⍲(⍵≤≢∆):0 perr 11 ⋄ _←0}
chkrange ← {⍺←1 ⋄ 1<⍴⍴⍵:0 perr 4 ⋄ >/w←2⍴⍵:0 perr 5 ⋄ ~∧/(w≥⍺)∧(w≤≢∆):0 perr 11 ⋄ _←0}
       d ← {0≠c←chkrange ⍵:_←c ⋄ ∆∆∘←∆ ⋄ ∆∘←∆[,(⍳≢∆)~rngidx ⍵] ⋄ __∘←_ ⋄ _∘←(≢∆)⌊⊃⍵ ⋄ ∆f∘←1 ⋄ _←0}
       e ← {∆f:2 perr 24 ⋄ 22::1 perr 22 ⋄ ∆∆∘←⊃∆ ∆e ∆nl∘←⎕NGET(⍙∘←⍵)1 ⋄ ⎕←2 ⎕NINFO ⍵ ⋄ __∘←_∘←≢∆ ⋄ _←0}
     efn ← {∆f:2 perr 24 ⋄ 2≠≡⍵:3 perr 11 ⋄ 1≠≢⍴⍵:3 perr 4 ⋄ z←RESET ⋄ ∆∆ _∘←∆ _ ⋄ ∆ _∘←⍵(≢⍵) ⋄ _←0}
    eval ← {⍎⍵}
       g ← {⍺←1,≢∆ ⋄ 0≠c←chkrange ⍺:_←c ⋄ i←rngidx ⍺ ⋄ ∆p∘←p←⍵ ∆p⊃⍨⍵≡'' ⋄ 0=≢z←1+i[p ⎕S 2⊢∆[i]]:_←0 ⋄ i∆ i_←∆ _ ⋄ _←⍺⍺{⍺⍺⊢_∘←⍵}¨z ⋄ ∆∆ __∘←i∆ i_ ⋄ ∆f∘←1 ⋄ _←0}
       i ← {0≠c←chkline ⍵:_←c ⋄ d←input ⋄ ∆∆∘←∆ ⋄ ∆∘←((0⌈⍵-1)↑∆),d,(0⌈⍵-1)↓∆ ⋄ ∆f∘←1 ⋄ __∘←_ ⋄ _∘←(0⌈⍵-1)+≢d ⋄ _←0}
       j ← {0≠c←chkrange ⍵:_←c ⋄ s e←2⍴⍵ ⋄ ∆∆∘←∆ ⋄ ∆∘←(∆↑⍨s-1),(,/∆[rngidx s e]),e↓∆ ⋄ ∆f∘←1 ⋄ __∘←_ ⋄ _∘←s ⋄ _←0}
       k ← {0≠c←chkline ⍺:_←c ⋄ ∆m,¨←(⊂⍵)⍺}
       l ← {0≠c←chkrange ⍵:_←c ⋄ z←{0⊣⎕←⍵}¨'\t' '$'⎕R'\\t' '$'⊢∆[rngidx ⍵] ⋄ _∘←⊃⌽2⍴⍵ ⋄ z←0}
       m ← {0≠c←chkline ⍵:_←c ⋄ 0≠c←chkrange⊢x y←2⍴⍺:_←c ⋄ (x≤⍵)∧(⍵≤y):0 perr 11
             z←(1+y-x)↑(x-1)↓∆ ⋄ 0≠c←d x y:_←c ⋄ ∆∆∘←∆ ⋄ ∆f∘←1 ⋄ __∘←_ ⋄ _∘←⍵+(⍵<x)×≢z ⋄ ∆∘←∆(↑,z,↓)⍨_-≢z ⋄ _←0}
       n ← {0≠c←chkrange ⍵:_←c ⋄ ⎕←(⊃⍵){(⍺+⍳≢⍵),⍪⍵}∆[rngidx ⍵] ⋄ _∘←⊃⌽2⍴⍵ ⋄ _←0}
       p ← {0≠c←chkrange ⍵:_←c ⋄ z←{0⊣⎕←⍵}¨∆[rngidx ⍵] ⋄ _∘←⊃⌽2⍴⍵ ⋄ z←0}
    perr ← {⎕←⍺⊃'BAD RANGE' 'FILE NOT FOUND' 'DIRTY' 'BAD DATA' 'NO MATCH' ⋄ _←⍵}
       r ← {0≠c←chkline ⍺:_←c ⋄ d←⊃⎕NGET⍣(1=≡⍵)⊢⍵ 1 ⋄ ∆∆∘←∆ ⋄ ∆∘←(⍺↑∆),d,⍺↓∆ ⋄ ∆f∘←1 ⋄ __∘←_ ⋄ _∘←⍺+≢d ⋄ ⍙∘←((1=≡⍵)∧⍙≡'')⊃⍙ ⍵ ⋄ _←0}
  rngidx ← {,(¯1+⊃⍵)+⍳1+-/⌽2⍴⍵}
       s ← {⍺←_,_ ⋄ p r g←3↑⍵,0 ⋄ ∆p∘←p←p ∆p⊃⍨p≡'' ⋄ 0≠c←chkrange ⍺:_←c ⋄ i←rngidx ⍺ ⋄ __∘←_ ⋄ _∘←1+i[⌈/p ⎕S 2⊢∆[i]] ⋄ ∆∆∘←∆ ⋄ ∆[i]←p ⎕R r⍠'ML'g⊢∆[i] ⋄ ∆f∘←1 ⋄ _←0}
       t ← {0≠c←chkline ⍵:_←c ⋄ 0≠c←chkrange 2⍴⍺:_←c ⋄ ∆∆∘←∆ ⋄ ∆∘←(⍵↑∆),∆[i←rngidx ⍺],(⍵↓∆) ⋄ ∆f∘←1 ⋄ __∘←_ ⋄ _∘←⍵+≢i ⋄ _←0}
       v ← {⍺←1,≢∆ ⋄ 0≠c←chkrange ⍺:_←c ⋄ i←rngidx ⍺ ⋄ ∆p∘←p←⍵ ∆p⊃⍨⍵≡'' ⋄ 0=≢z←1+i[(⍳≢i)~p ⎕S 2⊢∆[i]]:_←0 ⋄ i∆ i_←∆ _ ⋄ _←⍺⍺{⍺⍺⊢_∘←⍵}¨z ⋄ ∆∆ __∘←i∆ i_ ⋄ ∆f∘←1 ⋄ _←0}
       w ← {⍺←1,≢∆ ⋄ 0≠c←chkrange ⍺:_←c ⋄ ⎕←∆[rngidx ⍺]∆e ∆nl ⎕NPUT ⍵ 1 ⋄ ∆f∘←0 ⋄ ⍙∘←(''≡⍙)⊃⍙ ⍵ ⋄ _←0}
      wq ← {⍺←⊢ ⋄ 0≠c←⍺ w ⍵:_←c ⋄ q}
       z ← {⍺←_+1 ⋄ 0≠c←p ⍺(⍺+(⍵-1)⌊(≢∆)-⍺):_←c ⋄ _←0}

   ∇ z←_a
     z←1,≢∆
   ∇

   ∇ z←input
     z←0⍴⊂''
     {}{⍞}⍣{⍺≡,'.':1 ⋄ 0⊣z,←⊂⍺}⍬
   ∇

   ∇ {z}←q
     →∆f/F
     ⎕OFF
    F:⎕←'DIRTY'
     z←12
   ∇

   ∇ u
     ∆ ∆∆ _ __←∆∆ ∆ __ _
   ∇

   ∇ {z}←RESET
     ⍙ ∆ ∆∆ ∆e ∆f ∆nl ∆m ∆p _ __ z←''(0⍴⊂'')(0⍴⊂'')'UTF-8' 0(13 10)(⍬ ⍬)''0 0 0
   ∇

⎕SAVE 'ALE.dws'⍨⍣(0=≢args)⊃args←1↓2⎕NQ'.' 'GetCommandLineArgs'
