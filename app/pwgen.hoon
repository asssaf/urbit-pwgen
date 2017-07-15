:: Password generator based on urbit's base-256 alphabet
!:
|%
++  move  {bone *}
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
++  poke-noun
  |=  a/*
  ^-  {(list move) _+>.$}
  ~&  [%poked-with a]
  =^  r1  rng  (rads:rng 100)
  ~&  r1=r1
  [~ +>.$]
--
