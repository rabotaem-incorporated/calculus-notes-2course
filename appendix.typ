#import "config.typ"
#import "utils/core.typ": *

#set heading(numbering: (..numbers) => {
    let numbers = numbers.pos()
    if numbers.len() < 2 {
        none
    } else if numbers.len() == 2 {
        numbering("A.", numbers.at(1))
    }
})

= Приложение

== TODO-шки и упражнения

Все это, по хорошему, надо дописать/доделать/улучшить.

#context {
    let todos = query(selector(<todo-like>))

    list(..todos.map(el => {
        link(el.location(), el)
        box(width: 1fr, repeat[.])
        link(el.location())[#el.location().page()]
    }))

    if todos.len() == 0 [
        Ура! Долгов нет!
    ]
}

#if config.enable-ticket-references [
    == Ссылки на билеты <ticket-reference>

    #context enum(
        numbering: "1.",
        ..query(selector(<ticket>).before(<tickets-div>))
            .sorted(key: ticket-name-label => {
                counter("ticket").at(ticket-name-label.location()).first()
            }).map(ticket-name-label => {
                let ticket-location = ticket-name-label.location()

                enum.item(
                    counter("ticket").at(ticket-location).first(),
                    [
                        #link(ticket-location, ticket-name-label.body)
                        #box(width: 1fr, repeat[.])
                        #link(ticket-location)[#ticket-location.page()]
                    ]
                )
            })
    ))
]
