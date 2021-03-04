users = Users.create!([
                        { name: 'user1' },
                        { name: 'user2' },
                        { name: 'user3' }
                      ])

cat = Categories.create!([
                           { title: 'Ruby' },
                           { title: 'ML' },
                           { title: 'HTML' },
                           { title: 'C++' }
                         ])

tests = Test.create!([
                       { title: 'First', level: 1, category: cat[0].id, user: users[0].id },
                       { title: 'Second', level: 2, category: cat[1].id, user: users[1].id },
                       { title: 'Third', level: 1, category: cat[2].id, user: users[2].id },
                       { title: 'Fourth', level: 0, category: cat[3].id, user: users[0].id }
                     ])

quest = Questions.create!([
                            { title: 'First', test_id: tests[0].id },
                            { title: 'Second', test_id: tests[1].id },
                            { title: 'Third', test_id: tests[2].id },
                            { title: 'Fourth', test_id: tests[3].id }
                          ])

Answers.create!([
                  { title: '+', questions_id: quest[0].id },
                  { title: '-', correct: true, questions_id: quest[1].id },
                  { title: '+', questions_id: quest[2].id },
                  { title: '-', correct: true, questions_id: quest[3].id }
                ])

UserTests.create!([
                    { user_id: users[0].id, test_id: tests[0].id },
                    { user_id: users[1].id, test_id: tests[1].id },
                    { user_id: users[2].id, test_id: tests[2].id },
                    { user_id: users[0].id, test_id: tests[3].id }
                  ])
