using DoWhile
using Base.Test

# write your own tests here
i = 0
@do begin
    i += 1
end :while i < 10

@test i == 10

@do begin
    i -= 1
end :while i > 5

@show i
@test i == 5
