:: Password generator based on urbit's base-256 alphabet
!:
|%
++  move  {bone card}
++  card
  $%  {$diff mark *}
  ==
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
  =^  pw  rng  (pass a)
  ~&  pw=pw
  [~ +>.$]
::
++  poke-json
  |=  jon/json
  ^-  {(list move) _+>.$}
  ~|  [%poked-with jon=jon sup=sup.hid]
  =+  bits=(ni:jo jon)
  ?~  bits
    ~&  [%invalid-value jon=jon]
    [~ +>.$]
  =^  pw  rng  (pass +.bits)
  :_  +>.$
  %+  turn
    %+  pale  hid
    %+  both  (prix /pwgen/response)
    (bysrc src.hid)
  |=({o/bone *} [o %diff %json (jape pw)])
::
++  peer-pwgen
  |=  pax/path
  ^-  {(list move) _+>.$}
  ~&  [%subscribed-to pax=pax]
  [~ +>.$]
::
++  pass
  |=  bits/@
  ^-  {tape _rng}
  =+  str=(silt `(list @)`[48 64 ~])
  ?.  (~(has in str) bits)
    ~&  [%invalid-argument need=str was=bits]
    !!
  =+  r=(rads:rng (bex bits))
  [(scow %p -.r) +.r]
::
++  both  :: filter by two criteria
  |=  {a/$-(sink ?) b/$-(sink ?)}  |=  s/sink  ^-  ?
  &((a s) (b s))
::
++  bysrc            :: filter by src
  |=  src/ship  |=  sink  ^-  ?
  =(q.+< src)
--
