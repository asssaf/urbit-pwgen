$(function() {
  var password, $go48, $go64, $password, $passCont, $err

  $go48 = $('#go48')
  $go64 = $('#go64')
  $password = $('#password')
  $passCont = $('#pass-cont')
  $err = $('#err')

  $go48.on("click", function() { requestPassword(49) })
  $go64.on("click", function() { requestPassword(64) })

  function requestPassword(bits) {
    window.urb.send(
      bits, {mark: "json"}
    ,function(err,res) {
      if(err)
        return $err.text("There was an error. Sorry!")
      if(res.data !== undefined &&
         res.data.ok !== undefined &&
         res.data.ok !== true)
        $err.text(res.data.res)
      else
        console.log("poke succeeded");
    })
  }

  window.urb.appl = "pwgen"
  window.urb.bind('/pwgen/response/',
    function(err,dat) {
      password = dat.data
      $password.text(password)
      $passCont.show()
    }
  )
})
