local quotes = {
    {
        "Debugging is twice as hard as writing the code in the first place.",
        "Therefore, if you write the code as cleverly as possible,",
        "you are, by definition, not smart enough to debug it.",
        "",
        "-- Brian Kernighan",
    },
    {
        "If you don't fail at least 90% of the time, you're not aiming high enough.",
        "",
        "-- Alan Kay",
    },
    {
        "Always code as if the person who ends up maintaining your code",
        "is a violent psychopath who knows where you live.",
        "",
        "-- John Woods",
    },
    {
        "Perfection is achieved, not when there is nothing more to add,",
        "but when there is nothing left to take away.",
        "",
        "-- Antoine de Saint-Exupéry"
    },
    {
        "If you don't make mistakes, you're not working on hard enough problems.",
        "",
        "-- Frank Wilczek",
    },
    {
        "Use tracer bullets to find the target.",
        "Tracer bullets let you home in on your target",
        "by trying things and seeing how close they land.",
        "",
        "-- The Pragmatic Programmer"
    },
    {
        "Always design for concurrency.",
        "Allow for concurrency, and you'll design cleaner interfaces with fewer assumptions.",
        "",
        "-- The Pragmatic Programmer"
    },
    {
        "Test your software, or your users will.",
        "Test ruthlessly. Don't make your users find bugs for you.",
        "",
        "-- The Pragmatic Programmer"
    },
    {
        "Don't live with broken windows.",
        "Fix bad designs, wrong decisions, and poor code when you see them.",
        "",
        "-- The Pragmatic Programmer"
    },
    {
        "Keep knowledge in plain text.",
        "Plain text won't become obsolete.",
        "It helps leverage your work and simplifies debugging and testing.",
        "",
        "-- The Pragmatic Programmer"
    },
    {
        "Use a single editor well.",
        "The editor should be an extension of your hand;",
        "make sure your editor is configurable, extensible, and programmable.",
        "",
        "-- The Pragmatic Programmer"
    },
    {
        "Crash early.",
        "A dead program normally does a lot less damage than a crippled one.",
        "",
        "-- The Pragmatic Programmer"
    },
    {
        "Design to test.",
        "Start thinking about testing before you write a line of code.",
        "",
        "-- The Pragmatic Programmer"
    },
    {
        "Work with a user to think like a user.",
        "It's the best way to gain insight into how the system will really be used.",
        "",
        "-- The Pragmatic Programmer"
    },
    {
        "Test early. Test often. Test automatically.",
        "Tests that run with every build are much more effective",
        "than test plans that sit on a shelf.",
        "",
        "-- The Pragmatic Programmer"
    },
    {
        "Use saboteurs to test your testing.",
        "Introduce bugs on purpose in a separate copy of the source",
        "to verify that testing will catch them.",
        "",
        "-- The Pragmatic Programmer"
    },
    {
        "There's an old story about the person",
        "who wished his computer were as easy to use as his telephone.",
        "That wish has come true, since I no longer know how to use my telephone.",
        "",
        "-- Bjarne Stroustrup",
    },
    {
        'There are only two industries that refer to their customers as "users".',
        "",
        "-- Edward Tufte",
    },
    {
        "Easy things should be easy and hard things should be possible.",
        "",
        "-- Larry Wall",
    },
    {
        "They did not know it was impossible, so they did it!",
        "",
        "-- Mark Twain"
    },
    {
        "If debugging is the process of removing bugs,",
        "then programming must be the process of putting them in.",
        "",
        "-- Edsger W. Dijkstra",
    },
    {
        "The average user doesn't give a damn what happens,",
        "as long as (1) it works and (2) it's fast.",
        "",
        "-- Daniel J. Bernstein",
    },
    {
        'Object-oriented programming is an exceptionally bad idea',
        'which could only have originated in California',
        '',
        '-- Edsger Dijkstra'
    },
    {
        'Object oriented programs are offered as alternatives to correct ones',
        '',
        '-- Edsger Dijkstra'
    },
    {
        'Lisp has jokingly been called “the most intelligent way to misuse a computer”.',
        'I think that description is a great compliment because',
        'it transmits the full flavor of liberation:',
        'it has assisted a number of our most gifted fellow humans',
        'in thinking previously impossible thoughts.',
        '',
        '-- Edsger Dijkstra'
    },
    {
        'Design patterns are spoonfeed material for brainless programmers',
        'incapable of independent thought, who will be resolved to producing code',
        'as mediocre as the design patterns they use to create it.',
        '',
        '-- Christer Ericson'
    },
    {
        'It is incredible how much more readable x86_64 machine code is',
        'than the C++ source code that generates it',
        '',
        '-- Andrew Kelley'
    },
    {
        'Pointers have been lumped with goto statement as a marvelous way to create',
        'impossible-to-understand programs... With discipline, however,',
        'pointers can be used to achieve clarity and simplicity.',
        '',
        '-- Brian Kernighan & Dennis Ritchie'
    }
}

return function()
    math.randomseed(os.clock())

    local index = math.floor(math.random() * #quotes)

    return quotes[index + 1]
end
