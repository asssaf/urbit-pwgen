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
++  poke-atom
  |=  a/@
  ^-  {(list move) _+>.$}
  ?.  |(=(a 48) =(a 64))
    ~&  [%needed-argument 48 64]
    !!
  =^  r1  rng  (rads:rng (bex a))
  ~&  (scot %p r1)
  [~ +>.$]
--
