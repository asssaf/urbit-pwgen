;html
  ;head
    ;script(type "text/javascript", src "//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js");
    ;script(type "text/javascript", src "/~/at/lib/js/urb.js");
    ;title: Password Generator
    ;style(type "text/css")
      ; #pass-cont { display: none; }
      ; #password { font: monospace; }
    ==
  ==
  ;body
    ;h2:"Generate Password"
    ;div#pass-cont
      ;span:"Password: "
      ;code#password;
    ==
    ;script(type "text/javascript", src "/pages/pwgen/main.js");
    ;input#go48(type "button", value "48 bit");
    ;input#go64(type "button", value "64 bit");
    ;div#err(class "disabled");
    ;footer
      ;small
        ;a/"https://github.com/asssaf/urbit-pwgen"(target "_blank"): Source
      ==
    ==
  ==
==
