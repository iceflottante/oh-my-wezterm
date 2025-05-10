set windows-shell := ["nu", "-c"]

# canary recipe
[private]
default:
  @just --list

c:
  git add -A
  npx gitmoji-cli -c
  git push
