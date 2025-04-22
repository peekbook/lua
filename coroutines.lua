--Almost similar to threads in another language except that it cannot run in parallel
--Coroutines are used to pause and resume functions



co = coroutine.create(function()
    for i = 1, 10 do
        io.write("i = ", i, "\n")
        print(coroutine.status(co))
        if i == 5 then
            coroutine.yield()
        end
    end
end)


print(coroutine.status(co))
coroutine.resume(co)
print(coroutine.status(co))

co2 = coroutine.create(function()
    for i = 101, 110 do
        io.write("i = ", i, "\n")
        print(coroutine.status(co2))
    end
end)

coroutine.resume(co2)
coroutine.resume(co)

print(coroutine.status(co))