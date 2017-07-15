$(function() {
  var password, $go, $password, $err

  $go = $('#go')
  $password = $('#password')
  $err = $('#err')

  $go.on("click",
    function() {
      window.urb.send(
        48, {mark: "json"}
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
  })

  window.urb.appl = "pwgen"
  window.urb.bind('/pwgen/response/',
    function(err,dat) {
      password = dat.data
      $password.text("Password: " + password)
    }
  )
})
