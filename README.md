# NAME

**ALE** &#8211; arcfide's line editor

# DESCRIPTION

**ALE** is a line editor that I have created because I can. One of my all time
favorite editors to use in the classic Unix *ed(1)* editor. Line editors are,
in my opinion, grossly under-appreciated for their workflow and power as
interactive editors. With that said (or should I say, sed?), the pre-eminent
example of this in the modern computing world, *ed(1)*, does have a few issues
that I felt I could improve upon.

Furthermore, I was tired of the infrastructure setup that is required in order
to use a line editor inside of modern operating systems. They aren't convenient
to use by default in GUI environments, and there isn't a good, clean, fast way
to "just get" *ed(1)* on Windows, because so much of *ed(1)*'s design relies on
having the wider UNIX ecosystem available to it. This means, really, that if I
wanted to use *ed(1)* on Windows, I was more or less resigned to also installing
a rather heavyweight UNIX environment as well. This greatly interferes with the
simplicity of the editor itself, as well as integration.

Since almost all of my work is done with APL, I realized the potential value of
having an easy to use line editor that was written in a deeply integrated way
with the APL language. APL is itself a pretty good textual editing language, and
by simply creating a "dictionary" of editing commands, I could leverage the
power of the existing Dyalog APL session to do almost all the heavy lifting for
me. 

The result is an editor that retains the benefits of the *ed(1)* editor with
some noticeable improvements in flexibility, while simultaneously making the
editor itself simpler, easier to maintain, and amenable to customized
extensions, macros, and other composability and programmability benefits
usually only seen in more complex editors, all with basically zero real
additional complexity. 

In short, **ALE** is a programmable, composable, but simpler and more
streamlined, syntactically consistent replacement for the venerable
*ed(1)*. 

# LINE ADDRESSING

# COMMMANDS

<dl>
  <dt>e <em>file</em></dt>
  <dd>Edits <em>file</em> and sets the default filename. Clears and replaces 
  the existing edit buffer. The current address is set to the last line read.
  </dd>

  <dt>E <em>file</em></dt>
  <dd>Unconditionally edits <em>file</em>. This is like <strong>e</strong> but 
  it will erase a dirty buffer without warning.</dd>

  <dt>(1,≢∆)w <em>file</em></dt>
  <dd>Writes the addressed lines to <em>file</em>. Previous contents of 
  <em>file</em> are clobbered without warning. If there is no default filename, 
  then the default filename will be set to <em>file</em>, otherwise it is not 
  changed.</dd>

  <dt>(1,≢∆)wq <em>file</em></dt>
  <dd>Writes buffer to <em>file</em> as with <strong>w</strong> and then executes
  the <strong>q</strong> command.</dd>
</dl>

# COMPARING ED(1) TO ALE

| ed(1)                   | ALE           | Comments
| ----------------------- | ------------- | --------
| .                       | _             | Current line
| (.)a                    |               | Not yet implemented
| (.,.)c                  |               | Not yet implemented
| (.,.)d                  |               | Not yet implemented
| e file                  | e 'file'      | 
| e !command              |               | Not yet implemented
| E file                  | E 'file'      |
| f                       | ⍙             | Prints default filename
| f file                  | ⍙←'file'      | Sets default filename
| (1,$)g/re/command-list  |               | Not yet implemented
| (1,$)G/re/              |               | Not yet implemented
| H                       | N/A           | **ALE** errors are more verbose
| h                       | N/A           | See H
| (.)i                    |               | Not yet implemented
| (.,.+1)j                |               | Not yet implemented
| (.)k lc                 |               | Not yet implemented
| (.,.)l                  |               | Not yet implemented
| (.,.)m(.)               |               | Not yet implemented
| (.,.)n                  |               | Not yet implemented
| (.,.)p                  |               | Not yet implemented
| P                       | N/A           | APL session prompt is used
| q                       | q             | 
| Q                       | )off          | 
| ($)r file               |               | Not yet implemented
| ($)r !command           |               | Not yet implemented
| (.,.)s/re/replacement/  |               | Not yet implemented
| (.,.)s/re/replacement/g |               | Not yet implemented
| (.,.)s/re/replacement/n |               | Not yet implemented
| (.,.)s                  |               | Not yet implemented
| (.,.)t(.)               |               | Not yet implemented
| u                       |               | Not yet implemented
| (1,$)v/re/command-list  |               | Not yet implemented
| (1,$)V/re/              |               | Not yet implemented
| (1,$)w file             | (1,≢∆)w file  | Use ⍙ for default file
| (1,$)wq file            | (1,≢∆)wq file | Use ⍙ for default file
| (1,$)w !command         |               | Not yet implemented
| (1,$)W file             |               | Not yet implemented
| (.+1)z n                |               | Not yet implemented
| ($)=                    | N/A           | Ranges print themselves
| (.+1)newline            | N/A           | Use z instead
| !command                |               | Not yet implemented

# TIPS AND TRICKS

Because **ALE** is basically just a slightly optimized APL session, you have 
at your disposal the full power of APL. This leads to some interesting features 
that **ALE** can "have" if you want it to.

# FILES

**ALE** does not currently use a file buffer. This means that files are loaded
into memory and stored there. This limits the size of files that can be loaded 
to the size of your main memory and the swap space that you have available on 
your machine. 

# SEE ALSO

[The OpenBSD ed(1) man page](https://man.openbsd.org/ed)

# DIAGNOSTICS

All commands return an error code as the shy result of their execution. A 0 
value indicates success, and a non-zero value indicates the type of error that 
occured. 

# CAVEATS

**ALE** is very new software right now, and it may not be fully stable. Beware 
of this before using it in a mission critical environment. 
