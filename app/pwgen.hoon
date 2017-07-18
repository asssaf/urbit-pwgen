:: Password generator based on urbit's base-256 alphabet
/?  314
!:
|%
++  move  {bone card}
++  card
  $%  {$diff $pwgen-pw password}
  ==
++  password  {pw/tape bits/@}
--
::
|_  {hid/bowl rng/_og}
::++  prep  _`.  :: wipe state when app code is changed
++  prep       :: seed the rng with eny when code is changed
  |=  old/(unit _og)
  ^-  (quip move ..prep)
  ::[~ ..prep(+<+ u.+.old)]
  [~ ..prep(+<+ ~(. og eny.hid))]
::
++  poke-atom
  |=  a/@
  ^-  {(list move) _+>.$}
  ~&  [%poked-with a=a]
  =^  pw  rng  (radpass a)
  ~&  pw=pw
  [~ +>.$]
::
++  poke-json
  |=  jon/json
  ^-  {(list move) _+>.$}
  ~|  [%poked-with jon=jon]
  =+  bits=(ni:jo jon)
  ?~  bits
    ~&  [%invalid-value jon=jon]
    [~ +>.$]
  =^  pw  rng  (radpass +.bits)
  :_  +>.$
  %+  turn
    %+  pale  hid
    %+  both  (prix /pwgen/response)
    (bysrc src.hid)
  |=  {o/bone *}
  [o %diff %pwgen-pw pw]
::
++  peer-pwgen
  |=  pax/path
  ^-  {(list move) _+>.$}
  ~&  [%subscribed-to pax=pax]
  [~ +>.$]
::
++  radpass
  |=  bits/@
  ^-  {password _rng}
  =+  str=(silt `(list @)`[48 64 ~])
  ?.  (~(has in str) bits)
    ~&  [%invalid-argument need=str was=bits]
    !!
  =+  r=(rads:rng (bex bits))
  :_  +.r
  [(scow %p -.r) bits]
::
++  both  :: filter by two criteria
  |=  {a/$-(sink ?) b/$-(sink ?)}  |=  s/sink  ^-  ?
  &((a s) (b s))
::
++  bysrc            :: filter by src
  |=  src/ship  |=  sink  ^-  ?
  =(q.+< src)
--
