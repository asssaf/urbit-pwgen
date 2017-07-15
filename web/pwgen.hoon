;html
  ;head
    ;script(type "text/javascript", src "//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js");
    ;script(type "text/javascript", src "/~/at/lib/js/urb.js");
    ;title: Password Generator
  ==
  ;body
    ;div#password;
    ;script(type "text/javascript", src "/pwgen/main.js");
    ;input#go(type "button", value "Generate");
    ;div#err(class "disabled");
    ;footer
      ;small
        ;a/"https://github.com/asssaf/urbit-pwgen"(target "_blank"): Source
      ==
    ==
  ==
==
