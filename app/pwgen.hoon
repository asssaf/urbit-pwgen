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
  ?.  |(=(a 48) =(a 64))
    ~&  [%needed-argument 48 64]
    !!
  =^  r1  rng  (rads:rng (bex a))
  ~&  (scot %p r1)
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
  =^  pw  rng  (rads:rng (bex +.bits))
  :_  +>.$
  %+  turn  (pale hid (bysrc /pwgen/response src.hid))
  |=({o/bone *} [o %diff %json (jape (scow %p pw))])
::
++  peer-pwgen
  |=  pax/path
  ^-  {(list move) _+>.$}
  ~&  [%subscribed-to pax=pax]
  [~ +>.$]
::
++  bysrc            :: filter by src and path
  |=  {pax/path src/ship}  |=  sink  ^-  ?
  ?~  pax  &  ?~  r.+<  |
  &(=(i.pax i.r.+<) $(pax t.pax, r.+< t.r.+<) =(q.+< src))
--
