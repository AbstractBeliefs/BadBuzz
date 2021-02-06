def convert(i):
    three, five = map(lambda x: i % x, (3, 5))
    if not three:
        yield "Fizz"
    if not five:
        yield "Buzz"
    if three and five:
        yield str(i)


def inception(values=[]):
    we_need_to_go_deeper = 50 > len(values)
    if we_need_to_go_deeper:
        values.append(None)
        yield from (''.join(convert(len(values))), *inception())


# It's to easy to get off-by-one errors with loops & parameters…
print(*inception(), sep='\n')
