    Expect(number).To(SatisfyAll(
    BeNumerically(">", 0),
    BeNumerically("<", 10)))


    Expect(number).To(SatisfyAny(
    Equal(5),
    Equal(10))


    Expect(msg).To(Not(BeEmpty()))


    getName := func(p Person) string { return p.FirstName }
    Expect(person).To(WithTransform(getName, Equal("Roger")))


    // create a lightweight matcher
    func HaveFirstName(n string) GomegaMatcher {
        return WithTransform(func(p Person) string { return p.FirstName }, Equal(n))
    }
    // the matcher statement is simpler:
    Expect(person).To(HaveFirstName("Roger"))
