" Fasto setup
au BufNewFile,BufRead *.fo setlocal ft=fasto

" Pow setup
au BufNewFile,BufRead *.pow setlocal ft=pow
au BufNewFile,BufRead */playbooks/*.{yml,yaml} ft=yaml.ansible
au BufNewFile,BufRead */inventory/* ft=ansible_hosts
au BufNewFile,BufRead */templates/*.{yaml,tpl} ft=yaml.gotexttmpl
au BufNewFile,BufRead */.kube/config ft=yaml

" Awk
au BufNewFile *.awk     0put =\"#!/usr/bin/env awk\<nl>\<nl>\"|$

" Bash
au BufNewFile *.sh     0put =\"#!/usr/bin/env bash\<nl>\<nl>\"|$

" BATS - Bash Automated Testing System
au BufNewFile,BufRead *.bats set ft=bats

" C setup, Vim thinks .h is C++
au BufNewFile,BufRead *.h setlocal ft=c

" C#
au BufNewFile,BufRead *.proj set ft=xml
au BufNewFile,BufRead *.csproj set ft=xml
au BufNewFile,BufRead *.sln set ft=xml
au BufNewFile,BufRead *.aspx set ft=aspx.html syntax=aspx
au BufNewFile,BufRead *.ascx set ft=aspx.html syntax=aspx
au BufNewFile,BufRead *.master set ft=aspx.html syntax=aspx

" Carp
au BufRead,BufNewFile *.carp set ft=carp

" Chef
au BufRead,BufNewFile */cookbook/*/\(attributes\|definitions\|libraries\|providers\|recipesresources\)/*.rb setft=ruby.chef
au BufRead,BufNewFile */cookbook/*/templates/*/*.erb set ft=eruby.chef
au BufRead,BufNewFile */cookbook/*/metadata.rb set ft=ruby.chef
au BufRead,BufNewFile */chef-repo/environments/*.rb set ft=ruby.chef
au BufRead,BufNewFile */chef-repo/roles/*.rb set ft=ruby.chef

" Clojure
au BufNewFile,BufRead *.clj    set ft=clojure
au BufNewFile,BufRead *.cljc   set ft=clojure
au BufNewFile,BufRead *.cljs   set ft=clojure

" Coffeescript
au BufNewFile,BufRead *.coffee         set ft=coffee
au BufNewFile,BufRead *Cakefile        set ft=coffee
au BufNewFile,BufRead *.coffeekup,*.ck set ft=coffee
au BufNewFile,BufRead *._coffee        set ft=coffee
au BufNewFile,BufRead *.litcoffee      set ft=litcoffee
au BufNewFile,BufRead *.coffee.md      set ft=litcoffee
au BufNewFile,BufRead *.csx,*.cjsx     set ft=coffee

" CQL
au BufNewFile,BufRead *.cql set ft=cql

" Cryptol
au BufNewFile,BufRead *.cry set ft=cryptol
au BufNewFile,BufRead *.cyl set ft=cryptol
au BufNewFile,BufRead *.l" cry set ft=cryptol
au BufNewFile,BufRead *.lcyl set ft=cryptol

" Crystal
au BufNewFile,BufRead *.cr set ft=crystal
au BufNewFile,BufRead Projectfile set ft=crystal
au BufNewFile,BufRead *.ecr set ft=ecrystal

" csv
au BufNewFile,BufRead *.csv,*.dat,*.tsv,*.tab set ft=csv

" cucumber
au BufNewFile,BufRead *.feature,*.story set ft=cucumber

" cue
au BufNewFile,BufRead *.cue set ft=cuesheet

" Cypher
au BufNewFile,BufRead *cypher set ft=cypher

" dart
au BufNewFile,BufRead *.dart set ft=dart

" dhall
au BufNewFile,BufRead *.dhall set ft=dhall

" dlang
au BufNewFile,BufRead *.d set ft=d
au BufNewFile,BufRead *.lst set ft=dcov
au BufNewFile,BufRead *.dd set ft=dd
au BufNewFile,BufRead *.ddoc set ft=ddoc
au BufNewFile,BufRead *.sdl set ft=dsdl

" dockerfile
au BufNewFile,BufRead [Dd]ockerfile set ft=Dockerfile
au BufNewFile,BufRead Dockerfile* set ft=Dockerfile
au BufNewFile,BufRead [Dd]ockerfile.vim set ft=vim
au BufNewFile,BufRead *.dock set ft=Dockerfile
au BufNewFile,BufRead *.[Dd]ockerfile set ft=Dockerfile
au BufNewFile,BufRead docker-compose*.{yaml,yml}* set ft=yaml.docker-compose

" Duckscript
au BufRead,BufNewFile *.ds,*.duck set ft=duckscript

" elixir
au BufNewFile,BufRead *.ex,*.exs set ft=elixir
au BufNewFile,BufRead *.eex,*.leex set ft=eelixir
au BufNewFile,BufRead mix.lock set ft=elixir

" elm
au BufNewFile,BufRead *.elm set ft=elm

" emberscript
au BufNewFile,BufRead *.em set ft=ember-script

" emblem
au BufNewFile,BufRead *.emblem set ft=emblem

" erlang
au BufNewFile,BufRead *.erl,*.hrl,rebar.config,*.app,*.app.src,*.yaws,*.xrl,*.escript set ft=erlang
au BufNewFile         *.escript 0put =\"#!/usr/bin/env escript\<nl>\<nl>\"|$

" ferm
au BufNewFile,BufRead ferm.conf set ft=ferm
au BufNewFile,BufRead *.ferm set ft=ferm

" fish
au BufNewFile,BufRead *.fish set ft=fish
au BufNewFile         *.fish 0put =\"#!/usr/bin/env fish\<nl>\<nl>\"|$
au BufNewFile,BufRead ~/.config/fish/fish_{read_,}history set ft=yaml

" flatbuffers
au BufNewFile,BufRead *.fbs set ft=fbs

" Fountain
au BufRead,BufNewFile *.fountain set ft=fountain

" fsharp
au BufNewFile,BufRead *.fs,*.fsi,*.fsx set ft=fsharp

" gdscript
au BufNewFile,BufRead *.gd set ft=gdscript3
au BufNewFile,BufRead *.shader set ft=gsl

" git
au BufNewFile,BufRead *.git/{,modules/**/,worktrees/*/}{COMMIT_EDIT,TAG_EDIT,MERGE_,}MSG set ft=gitcommit
au BufNewFile,BufRead *.git/config,.gitconfig,gitconfig,.gitmodules set ft=gitconfig
au BufNewFile,BufRead */.config/git/config set ft=gitconfig
au BufNewFile,BufRead *.git/modules/**/config set ft=gitconfig
au BufNewFile,BufRead git-rebase-todo set ft=gitrebase
au BufNewFile,BufRead .gitsendemail.* set ft=gitsendemail
au BufNewFile,BufRead *.git/**
    \ if getline(1) =~ '^\x\{40\}\>\|^ref: ' |
    \   set ft=git |
    \ endif

" This logic really belongs in scripts.vim
au BufNewFile,BufRead,StdinReadPost *
    \ if getline(1) =~ '^\(commit\|tree\|object\) \x\{40\}\>\|^tag \S\+$' |
    \   set ft=git |
    \ endif
au BufNewFile,BufRead *
    \ if getline(1) =~ '^From \x\{40\} Mon Sep 17 00:00:00 2001$' |
    \   set filetype=gitsendemail |
    \ endif

" Gleam
au BufRead,BufNewFile *.gleam set ft=gleam

" glsl
au BufNewFile,BufRead *.vert,*.tesc,*.tese,*.glsl,*.geom,*.frag,*.comp set ft=glsl

" gmpl
au BufNewFile,BufRead *.mod set ft=gmpl

" go
au BufNewFile,BufRead *.go set ft=go
au BufNewFile,BufRead *.s set ft=asm
au BufNewFile,BufRead *.tmpl set ft=gohtmltmpl
au BufNewFile,BufRead go.mod set ft=gomod

" graphql
au BufNewFile,BufRead *.graphql,*.graphqls,*.gql set ft=graphql

" gradle
au BufNewFile,BufRead *.gradle set ft=groovy

" haml
au BufNewFile,BufRead *.haml,*.hamlbars,*.hamlc set ft=haml

" handlebars
au  BufNewFile,BufRead *.mustache,*.hogan,*.hulk,*.hjs set ft=html.mustache syn=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim indent/handlebars.vim
au  BufNewFile,BufRead *.handlebars,*.hdbs,*.hbs,*.hb set ft=html.handlebars syn=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim

" haproxy
au BufNewFile,BufRead haproxy*.c* set ft=haproxy

" haskell
au BufNewFile,BufRead *.hsc set ft=haskell
au BufNewFile,BufRead *.bpk set ft=haskell
au BufNewFile,BufRead *.hsig set ft=haskell

" haxe
au BufNewFile,BufRead *.hx set ft=haxe

" hcl
au BufNewFile,BufRead *.hcl set ft=hcl
au BufNewFile,BufRead *.nomad set ft=hcl
au BufNewFile,BufRead *.tf set ft=hcl
au BufNewFile,BufRead Appfile set ft=hcl

" helm
au BufNewFile,BufRead */templates/*.yaml,*/templates/*.tpl set ft=helm

" hive
au BufNewFile,BufRead *.hql set ft=hive
au BufNewFile,BufRead *.ql set ft=hive
au BufNewFile,BufRead *.q set ft=hive

" i3
au BufNewFile,BufRead .i3.config,i3.config,*.i3config,*.i3.config set ft=i3config

" icalendar
au BufNewFile,BufRead *.ics set ft=icalendar

" idris
au BufNewFile,BufRead *.idr set ft=idris
au BufNewFile,BufRead idris-response set ft=idris
au BufNewFile,BufRead *.lidr set ft=lidris

" Info
au BufRead,BufNewFile *.info set ft=info

" ion
au BufNewFile,BufRead ~/.config/ion/initrc set ft=ion
au BufNewFile,BufRead *.ion set ft=ion
au BufNewFile         *.ion 0put =\"#!/usr/bin/env ion\<nl>\<nl>\"|$

" Janus setup
au BufNewFile,BufRead *.ja setlocal ft=janus

" javascript
au BufNewFile,BufRead *.flow set ft=flow
au BufNewFile,BufRead yarn.lock set ft=yaml
au BufNewFile,BufRead .flowconfig set ft=ini
au BufNewFile,BufRead *.js.map set ft=json
au BufNewFile,BufRead .jsbeautifyrc set ft=json
au BufNewFile,BufRead .eslintrc set ft=json
au BufNewFile,BufRead .jscsrc set ft=json
au BufNewFile,BufRead .babelrc set ft=json
au BufNewFile,BufRead .watchmanconfig set ft=json
au BufNewFile,BufRead .buckconfig set ft=toml
au BufNewFile,BufRead .flowconfig set ft=ini
au BufNewFile,BufRead *.{js,mjs,cjs,jsm,es,es6} set ft=javascript foldmethod=expr
au BufNewFile,BufRead .tern-{project,port} set ft=json
au BufNewFile,BufRead *.postman_collection set ft=json

" jenkins
au BufNewFile,BufRead Jenkinsfile set ft=Jenkinsfile
au BufNewFile,BufRead Jenkinsfile* set ft=Jenkinsfile
au BufNewFile,BufRead *.jenkinsfile set ft=Jenkinsfile
au BufNewFile,BufRead *.jenkinsfile set ft=Jenkinsfile
au BufNewFile,BufRead *.Jenkinsfile set ft=Jenkinsfile

" jinja
au BufNewFile,BufRead *.jinja2,*.j2,*.jinja,*.nunjucks,*.nunjs,*.njk set ft=jinja
au BufNewFile,BufRead *.html.jinja2,*.html.j2,*.html.jinja,*.htm.jinja2,*.htm.j2,*.htm.jinja set ft=jinja.html

" json5
au BufNewFile,BufRead *.json5 set ft=json5

" json
au BufNewFile,BufRead *.json set ft=json
au BufNewFile,BufRead *.jsonl set ft=json
au BufNewFile,BufRead *.jsonp set ft=json
au BufNewFile,BufRead *.geojson set ft=json
au BufNewFile,BufRead *.template set ft=json

" jst
au BufNewFile,BufRead *.ejs set ft=jst
au BufNewFile,BufRead *.jst set ft=jst
au BufNewFile,BufRead *.djs set ft=jst
au BufNewFile,BufRead *.hamljs set ft=jst
au BufNewFile,BufRead *.ect set ft=jst

" jsx
au BufNewFile,BufRead *.jsx set ft=javascriptreact foldmethod=expr

" julia
au BufNewFile,BufRead *.jl set ft=julia
au BufNewFile         *.jl       0put =\"#!/usr/bin/env julia\<nl>\<nl>\"|$

" justfile
au BufNewFile,BufRead Justfile,justfile ft=make

" kotlin
au BufNewFile,BufRead *.kt set ft=kotlin
au BufNewFile,BufRead *.kts set ft=kotlin

" ledger
au BufNewFile,BufRead *.ldg,*.ledger,*.journal set ft=ledger

" less
au BufNewFile,BufRead *.less set ft=less

" lilypond
au BufNewFile,BufRead *.ly,*.ily set ft=lilypond

" livescript
au BufNewFile,BufRead *.ls set ft=ls
au BufNewFile,BufRead *Slakefile set ft=ls

" llvm
au BufNewFile,BufRead *.ll set ft=llvm

" llvm
au BufNewFile,BufRead lit.*cfg set ft=python
au BufNewFile,BufRead *.td set ft=tablegen

" log
au BufNewFile,BufRead *.log set ft=log
au BufNewFile,BufRead *_log set ft=log

" lua
" au BufNewFile *.lua     0put =\"#!/usr/bin/env lua\<nl>\<nl>\"|$
au BufNewFile,BufRead *.lua set ft=lua foldmethod=expr

" mako
au BufNewFile *.*.mako execute "do BufNewFile filetypedetect " . expand("<afile>:r") | let b:mako_outer_lang = &filetype
au BufReadPre *.*.mako execute "do BufRead filetypedetect " . expand("<afile>:r") | let b:mako_outer_lang = &filetype
au BufNewFile,BufRead *.mako set ft=mako

" markdown
au BufNewFile,BufRead *.{md,mdown,mkd,mkdn,markdown,mdwn} set ft=markdown
au BufNewFile,BufRead *.{md,mdown,mkd,mkdn,markdown,mdwn}.{des3,des,bf,bfa,aes,idea,cast,rc2,rc4,rc5,desx} set ft=markdown

" mathematica
au BufNewFile,BufRead *.wl set ft=mma
au BufNewFile,BufRead *.wls set ft=mma
au BufNewFile,BufRead *.nb set ft=mma
au BufNewFile,BufRead *.m set ft=mma

" mdx
au BufNewFile,BufRead *.mdx set ft=markdown.mdx

" Mercury
au BufRead,BufNewFile *.m,*.moo set ft=mercury

" meson
au BufNewFile,BufRead meson.build set ft=meson
au BufNewFile,BufRead meson_options.txt set ft=meson
au BufNewFile,BufRead *.wrap set ft=dosini

" moonscript
au BufNewFile,BufRead *.moon set ft=moon

" nginx
au BufNewFile,BufRead *.nginx set ft=nginx
au BufNewFile,BufRead nginx*.conf set ft=nginx
au BufNewFile,BufRead *nginx.conf set ft=nginx
au BufNewFile,BufRead */etc/nginx/* set ft=nginx
au BufNewFile,BufRead */usr/local/nginx/conf/* set ft=nginx
au BufNewFile,BufRead */nginx/*.conf set ft=nginx

" nim
au BufNewFile,BufRead *.nim,*.nims,*.nimble set ft=nim

" nix
au BufNewFile,BufRead *.nix set ft=nix

" ocaml
au BufNewFile,BufRead jbuild,dune,dune-project,dune-workspace set ft=dune
au BufNewFile,BufRead _oasis set ft=oasis
au BufNewFile,BufRead *.ml,*.mli,*.mll,*.mly,.ocamlinit,*.mlt,*.mlp,*.mlip,*.mli.cppo,*.ml.cppo set ft=ocaml
au BufNewFile,BufRead _tags set ft=ocamlbuild_tags
au BufNewFile,BufRead OMakefile,OMakeroot,*.om,OMakeroot.in set ft=omake
au BufNewFile,BufRead opam,*.opam,*.opam.template set ft=opam
au BufNewFile,BufRead *.sexp set ft=sexplib

" opencl
au BufNewFile,BufRead *.cl set ft=opencl

" Pawn
au BufNewFile,BufRead *.p,*.pwn,*.pawn set ft=pawn

" Pandoc
au BufNewFile,BufRead,BufFilePost *.pandoc,*.pdk,*.pd,*.pdc set ft=pandoc

" PERL
au BufNew,BufNewFile,BufRead *.nqp set ft=perl6
au BufNew *.pl 0put =\"#!/usr/bin/env perl\<nl>\<nl>\"|$

" PostgreSQL
au BufNewFile,BufRead *.pgsql let b:sql_type_override='pgsql' | set ft=sql

" PHP
au BufNewFile *.php     0put =\"#!/usr/bin/env php\<nl>\<nl>\"|$

" plantuml
au BufNewFile,BufRead *.pu,*.uml,*.plantuml,*.puml set ft=plantuml

" Portfile
au BufNewFile,BufRead Portfile set filetype=portfile

" pony
au BufNewFile,BufRead *.pony set ft=pony

" powershell
au BufNewFile,BufRead *.ps1 set ft=ps1
au BufNewFile,BufRead *.psd1 set ft=ps1
au BufNewFile,BufRead *.psm1 set ft=ps1
au BufNewFile,BufRead *.pssc set ft=ps1
au BufNewFile,BufRead *.ps1xml set ft=ps1xml
au BufNewFile,BufRead *.cdxml set ft=xml
au BufNewFile,BufRead *.psc1 set ft=xml

" Prolog
au BufNewFile,BufRead *.prolog set filetype=prolog

" Protobuf
au BufNewFile,BufRead *.proto set ft=proto

" pug
au BufNewFile,BufRead *.pug set ft=pug
au BufNewFile,BufRead *.jade set ft=pug

" puppet
au BufNewFile,BufRead *.pp set ft=puppet
au BufNewFile,BufRead *.epp set ft=embeddedpuppet
au BufNewFile,BufRead Puppetfile set ft=ruby

" purescript
au BufNewFile,BufRead *.purs set ft=purescript

" Python
au BufNewFile *.py     0put =\"#!/usr/bin/env python3\<nl>\<nl>\"|$

" qmake
au BufNewFile,BufRead *.pri set ft=qmake

" qmake
au BufNewFile,BufRead *.pro set ft=qmake

" qml
au BufNewFile,BufRead *.qml set ft=qml

" R
au BufNewFile,BufRead *.Rout set ft=rout
au BufNewFile,BufRead *.Rout.save set ft=rout
au BufNewFile,BufRead *.Rout.fail set ft=rout
au BufNewFile,BufRead *.Rprofile set ft=r

" racket
au BufNewFile,BufRead *.rkt,*.rktl set ft=racket

" raku
au BufNewFile,BufRead *.pm6,*.p6,*.t6,*.pod6,*.raku,*.rakumod,*.rakudoc,*.rakutest set ft=raku

" raml
au BufNewFile,BufRead *.raml set ft=raml

" razor
au BufNewFile,BufRead *.cshtml set ft=razor

" reason
au BufNewFile,BufRead *.re set ft=reason
au BufNewFile,BufRead *.rei set ft=reason
au BufNewFile,BufRead .merlin set ft=merlin

" RON
au BufRead,BufNewFile *.ron set ft=ron

" ruby
au BufNewFile,BufRead *.erb,*.rhtml set ft=eruby
au BufNewFile,BufRead .irbrc,irbrc set ft=ruby
au BufNewFile,BufRead *.rb,*.rbw,*.gemspec set ft=ruby
au BufNewFile,BufRead *.ru set ft=ruby
au BufNewFile,BufRead Gemfile set ft=ruby
au BufNewFile,BufRead *.builder,*.rxml,*.rjs,*.ruby set ft=ruby
au BufNewFile,BufRead [rR]akefile,*.rake set ft=ruby
au BufNewFile,BufRead [rR]antfile,*.rant set ft=ruby
au BufNewFile,BufRead Appraisals set ft=ruby
au BufNewFile,BufRead .autotest set ft=ruby
au BufNewFile,BufRead *.axlsx set ft=ruby
au BufNewFile,BufRead [Bb]uildfile set ft=ruby
au BufNewFile,BufRead Capfile,*.cap set ft=ruby
au BufNewFile,BufRead Cheffile set ft=ruby
au BufNewFile,BufRead Berksfile set ft=ruby
au BufNewFile,BufRead Podfile,*.podspec set ft=ruby
au BufNewFile,BufRead Guardfile,.Guardfile set ft=ruby
au BufNewFile,BufRead *.jbuilder set ft=ruby
au BufNewFile,BufRead KitchenSink set ft=ruby
au BufNewFile,BufRead *.opal set ft=ruby
au BufNewFile,BufRead .pryrc set ft=ruby
au BufNewFile,BufRead Puppetfile set ft=ruby
au BufNewFile,BufRead *.rabl set ft=ruby
au BufNewFile,BufRead [rR]outefile set ft=ruby
au BufNewFile,BufRead .simplecov set ft=ruby
au BufNewFile,BufRead *.rbi set ft=ruby
au BufNewFile,BufRead [tT]horfile,*.thor set ft=ruby
au BufNewFile,BufRead [vV]agrantfile set ft=ruby
au BufNewFile,BufRead Brewfile set ft=ruby
au BufNewFile         *.rb 0put =\"#!/usr/bin/env ruby\<nl>\<nl>\"|$

" Declared after ruby so that the more general *.rb
" doesn't override
" rspec
au BufNewFile,BufRead *_spec.rb set ft=rspec

" rust
au BufNewFile,BufRead *.rs set ft=rust

" scala
au BufNewFile,BufRead *.scala,*.sc set ft=scala
au BufNewFile         *.scala   0put =\"#!/usr/bin/env scala\<nl>\<nl>\"|$
au BufNewFile,BufRead *.sbt set ft=sbt.scala
au BufNewFile,BufRead *.sbt set ft=sbt.scala

" scss
au BufNewFile,BufRead *.scss set ft=scss

" slim
au BufNewFile,BufRead *.slim set ft=slim

" slime
au BufNewFile,BufRead *.slime set ft=slime

" smt2
au BufNewFile,BufRead *.smt,*.smt2 set ft=smt2

" solidity
au BufNewFile,BufRead *.sol set ft=solidity

" Starlark
au BufNewFile,BufRead *.star set ft=starlark
au BufNewFile,BufRead BUILD.bazel set ft=starlark
au BufNewFile,BufRead BUILD set ft=starlark
au BufNewFile,BufRead Tiltfile* set ft=starlark

" Sugarss
au BufRead,BufNewFile *.sss set ft=sugarss

" stylus
au BufNewFile,BufRead *.styl set ft=stylus
au BufNewFile,BufRead *.stylus set ft=stylus

" svelte
au BufNewFile,BufRead *.svelte set ft=svelte

" sway
au BufNewFile,BufRead *config/sway/* set filetype=sh

" swift
au BufNewFile,BufRead *.swift set ft=swift

" sxhkd
au BufNewFile,BufRead sxhkdrc,*.sxhkdrc set ft=sxhkdrc

" systemd
au BufNewFile,BufRead *.automount set ft=systemd
au BufNewFile,BufRead *.mount set ft=systemd
au BufNewFile,BufRead *.path set ft=systemd
au BufNewFile,BufRead *.service set ft=systemd
au BufNewFile,BufRead *.socket set ft=systemd
au BufNewFile,BufRead *.swap set ft=systemd
au BufNewFile,BufRead *.target set ft=systemd
au BufNewFile,BufRead *.timer set ft=systemd

" Teal
au BufNewFile,BufRead *.tl set ft=teal

" terraform
au BufNewFile,BufRead *.tf set ft=terraform
au BufNewFile,BufRead *.tfvars set ft=terraform
au BufNewFile,BufRead *.tfstate set ft=json
au BufNewFile,BufRead *.tfstate.backup set ft=json

" textile
au BufNewFile,BufRead *.textile set ft=textile

" thrift
au BufNewFile,BufRead *.thrift set ft=thrift

" tmux
au BufNewFile,BufRead {.,}tmux.conf set ft=tmux

" TOML
au BufNewFile,BufRead *.toml,Gopkg.lock,Cargo.lock,*/.cargo/config,*/.cargo/credentials,Pipfile set ft=toml

" Cargo Make
au BufRead,BufNewFile Makefile.toml set ft=cargo-make

" tptp
au BufNewFile,BufRead *.p set ft=tptp
au BufNewFile,BufRead *.tptp set ft=tptp
au BufNewFile,BufRead *.ax set ft=tptp

" twig
au BufNewFile,BufRead *.twig set ft=html.twig
au BufNewFile,BufRead *.html.twig set ft=html.twig
au BufNewFile,BufRead *.xml.twig set ft=xml.twig

" typescript
au BufNewFile,BufRead *.ts set ft=typescript foldmethod=expr
au BufNewFile,BufRead *.tsx set ft=typescriptreact foldmethod=expr

" v
au BufNewFile,BufRead *.v set ft=vlang

" vala
au BufNewFile,BufRead *.vala,*.vapi,*.valadoc set ft=vala

" vbnet
au BufNewFile,BufRead *.vb set ft=vbnet

" vcl
au BufNewFile,BufRead *.vcl set ft=vcl

" vifm
au BufNewFile,BufRead vifmrc set ft=vifm
au BufNewFile,BufRead *vifm/colors/* set ft=vifm
au BufNewFile,BufRead *.vifm set ft=vifm
au BufNewFile,BufRead vifm.rename* set ft=vifm-rename

" vm
au BufNewFile,BufRead *.vm set ft=velocity

" vue
au BufNewFile,BufRead *.vue,*.wpy set ft=vue

" xdc
au BufNewFile,BufRead *.xdc set ft=xdc

" YANG
au BufRead,BufNewFile *.yang set ft=yang

" Zephir
au BufNewFile,BufRead *.zep set ft=zephir

" Zig
au BufNewFile,BufRead *.zig set ft=zig
au BufNewFile,BufRead *.zir set ft=zir


" Shebang
" Auto Detection
function! s:detect_filetype(line, patterns) " {{{ try to detect current filetype
    for pattern in keys(a:patterns)
        if a:line =~# pattern
            return a:patterns[pattern]
        endif
    endfor
endfunction

" internal shebang store
let s:shebangs = {}
let g:shebang_enable_debug = 0
command! -nargs=* -bang AddShebangPattern
    \ call s:add_shebang_pattern(<f-args>, <bang>0)
function! s:add_shebang_pattern(filetype, pattern, ...) " {{{ add shebang pattern to filetype
    if a:0 == 2
        let [pre_hook, force] = [a:1, a:2]
    else
        let [pre_hook, force] = ['', a:000[-1]]
    endif
    try
        if !force && has_key(s:shebangs, a:pattern)
            throw string(a:pattern) . " is already defined, use ! to overwrite."
        endif
        let s:shebangs[a:pattern] = {
            \ 'filetype': a:filetype,
            \ 'pre_hook': pre_hook
            \ }
    catch
        echohl ErrorMsg
        echomsg "Add shebang pattern: " . v:exception
        echohl None
    endtry
endfunction

function! s:shebang() " {{{ set valid filetype based on shebang line
    try
        let line = getline(1)
        if empty(line)
            return
        endif

        let match = s:detect_filetype(line, s:shebangs)
        if empty(match)
            throw "Filetype detection failed for line: '" . line . "'"
        endif
        exe match.pre_hook
        exe 'setfiletype ' . match.filetype
    catch
        if g:shebang_enable_debug
            echohl ErrorMsg
            echomsg v:exception
            echohl None
        endif
    endtry
endfunction

" Default patterns
" add default shebang patterns, paths of the following form are handled:
" /bin/interpreter
" /usr/bin/interpreter
" /bin/env interpreter
" /usr/bin/env interpreter

" applescript
AddShebangPattern! applescript   ^#!.*\s\+osascript\>
AddShebangPattern! applescript   ^#!.*[s]\?bin/osascript\>
" escript
AddShebangPattern! erlang        ^#!.*\s\+escript\>
AddShebangPattern! erlang        ^#!.*[s]\?bin/escript\>
" js
AddShebangPattern! javascript    ^#!.*\s\+node\>
" lua
AddShebangPattern! lua           ^#!.*\s\+lua\>
AddShebangPattern! lua           ^#!.*[s]\?bin/lua\>
" perl
AddShebangPattern! perl          ^#!.*\s\+perl\>
AddShebangPattern! perl          ^#!.*[s]\?bin/perl\>
" php
AddShebangPattern! php           ^#!.*\s\+php\>
AddShebangPattern! php           ^#!.*[s]\?bin/php\>
" python
AddShebangPattern! python        ^#!.*\s\+python\>
AddShebangPattern! python        ^#!.*[s]\?bin/python\>
AddShebangPattern! python        ^#!.*\s\+pypy\>
AddShebangPattern! python        ^#!.*[s]\?bin/pypy\>
AddShebangPattern! python        ^#!.*\s\+jython\>
AddShebangPattern! python        ^#!.*[s]\?bin/jython\>
" ruby
AddShebangPattern! ruby          ^#!.*\s\+ruby\>
AddShebangPattern! ruby          ^#!.*[s]\?bin/ruby\>
" support most of shells: bash, ash, csh, dash, fish, ion, ksh, mksh, pdksh, sh, tcsh, zsh
AddShebangPattern! fish          ^#!.*\s\+fish\>
AddShebangPattern! fish          ^#!.*[s]\?bin/fish\>
AddShebangPattern! ion           ^#!.*\s\+ion\>
AddShebangPattern! ion           ^#!.*[s]\?bin/ion\>
AddShebangPattern! sh            ^#!.*[s]\?bin/sh\>    let\ b:is_sh=1|if\ exists('b:is_bash')|unlet\ b:is_bash|endif
AddShebangPattern! sh            ^#!.*[s]\?bin/bash\>  let\ b:is_bash=1|if\ exists('b:is_sh')|unlet\ b:is_sh|endif
AddShebangPattern! sh            ^#!.*\s\+\(c\|a\|da\|k\|pdk\|mk\|tc\)\?sh\>
AddShebangPattern! zsh           ^#!.*\s\+zsh\>
AddShebangPattern! zsh           ^#!.*[s]\?bin/zsh\>
AddShebangPattern! bats          ^#!.*\<bats\>
AddShebangPattern! raku          ^#!.*raku
AddShebangPattern! teal           ^#!.*\s\+tl\>
AddShebangPattern! teal           ^#!.*[s]\?bin/tl\>

augroup shebang
    au!
    " try to detect filetype after enter to buffer
    au BufEnter * if !did_filetype() | call s:shebang() | endif
augroup END
