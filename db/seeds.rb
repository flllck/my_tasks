projects = Project.create!([
                             { title: 'Family' },
                             { title: 'Work' },
                             { title: 'Other' }
                           ])

Todo.create!([
                { text: 'Buy a milk', isCompleted: false, project: projects[0] },
                { text: 'Change engine oil before 23 april', isCompleted: false, project: projects[0] },
                { text: 'Send a letter to grandma', isCompleted: true, project: projects[0] },
                { text: 'Pay for an apartment', isCompleted: false, project: projects[0] },
                { text: 'Pick up shoes from repair', isCompleted: false, project: projects[0] },
                { text: 'Call the customer', isCompleted: true, project: projects[1] },
                { text: 'Send documents', isCompleted: true, project: projects[1] },
                { text: 'Fill out a report', isCompleted: false, project: projects[1] },
                { text: 'Call a friend', isCompleted: false, project: projects[2] },
                { text: 'Prepare for the trip', isCompleted: false, project: projects[2] }
              ])
