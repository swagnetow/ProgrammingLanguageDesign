% Teachers and the sections they teach.
teaches(roberts, 101.01).
teaches(yoon, 210.01).
teaches(theis, 210.02).
teaches(sosnick, 210.03).
teaches(sosnick, 210.04).
teaches(wong, 211.01).
teaches(wong, 220.01).
teaches(wong, 220.02).
teaches(okada, 230.01).
teaches(hsu, 256.01).
teaches(tomasevich, 300.01).
teaches(tomasevich, 300.02).
teaches(hsu, 309.01).
teaches(yang, 340.01).
teaches(yang, 340.01).
teaches(wong, 412.01).
teaches(levine, 413.01).
teaches(levine, 413.02).
teaches(murphy, 415.01).
teaches(wall, 510.01).
teaches(levine, 520.01).
teaches(wall, 520.01).
teaches(dujmovic, 600.01).
teaches(yoon, 631.01).
teaches(petkovic, 640.01).
teaches(sosnick, 640.01).
teaches(dujmovic, 641.01).
teaches(murphy, 675.01).
teaches(petkovic, 694.01).
teaches(petkovic, 694.02).
teaches(petkovic, 694.03).
teaches(levine, 695.01).

% Teachers that teaches 100 level classes.
freshman(101.01).

% Teachers that teach 200 level classes.
sophomore(210.01).
sophomore(210.02).
sophomore(210.03).
sophomore(210.04).
sophomore(211.01).
sophomore(220.01).
sophomore(220.02).
sophomore(230.01).
sophomore(256.01).

% Teachers that teach 300-400 level classes.
junior(309.01).
junior(340.01).
junior(340.01).
junior(412.01).
junior(413.01).
junior(413.02).
junior(415.01).

% Teachers that teach 500-600 level classes.
senior(510.01).
senior(520.01).
senior(520.01).
senior(600.01).
senior(631.01).
senior(640.01).
senior(640.01).
senior(641.01).
senior(675.01).
senior(694.01).
senior(694.02).
senior(694.03).
senior(695.01).

% Classes that are before 12PM.
morning(210.01).
morning(210.03).
morning(210.04).
morning(220.01).
morning(220.02).
morning(413.01).
morning(413.02).
morning(510.01).

% Classes that are after 12PM.
afternoon(101.01).
afternoon(210.02).
afternoon(211.01).
afternoon(230.01).
afternoon(256.01).
afternoon(300.01).
afternoon(300.02).
afternoon(309.01).
afternoon(340.01).
afternoon(340.02).
afternoon(412.01).
afternoon(415.01).
afternoon(510.01).
afternoon(520.01).
afternoon(520.02).
afternoon(600.01).
afternoon(631.01).
afternoon(640.01).
afternoon(641.01).
afternoon(675.01).

% Classes that are on Tuesdays or Thursdays.
tth(101.01).
tth(210.01).
tth(210.02).
tth(230.01).
tth(340.01).
tth(340.02).
tth(413.01).
tth(413.02).
tth(520.01).
tth(520.02).
tth(631.01).
tth(640.01).

% Classes that are on Monday or Wednesdays or Fridays.
mwf(210.03).
mwf(210.04).
mwf(211.01).
mwf(220.01).
mwf(220.02).
mwf(256.01).
mwf(300.01).
mwf(300.02).
mwf(309.01).
mwf(412.01).
mwf(415.01).
mwf(510.01).
mwf(600.01).
mwf(641.01).
mwf(675.01).

teaches_freshman(INSTRUCTOR) :- freshman(CLASS),
                                teaches(INSTRUCTOR, CLASS).
teaches_sophomore(INSTRUCTOR) :- sophomore(CLASS),
                                 teaches(INSTRUCTOR, CLASS).
teaches_junior(INSTRUCTOR) :- junior(CLASS),
                              teaches(INSTRUCTOR, CLASS).
teaches_senior(INSTRUCTOR) :- senior(CLASS),
                              teaches(INSTRUCTOR, CLASS).
teaches_afternoon(INSTRUCTOR) :- teaches(INSTRUCTOR, AFTERNOON),
                                 afternoon(AFTERNOON).
teaches_morning(INSTRUCTOR) :- teaches(INSTRUCTOR, MORNING),
                               morning(MORNING).
teaches_whole_day(INSTRUCTOR) :- teaches(INSTRUCTOR, MORNING),
                                 morning(MORNING),
                                 teaches(INSTRUCTOR, AFTERNOON),
                                 afternoon(AFTERNOON).
works_mwf(INSTRUCTOR) :- teaches(INSTRUCTOR, MWF), mwf(MWF).
works_tth(INSTRUCTOR) :- teaches(INSTRUCTOR, TTH), tth(TTH).
teaches_three_classes(INSTRUCTOR) :- teaches(INSTRUCTOR, CLASS1),
                                     teaches(INSTRUCTOR, CLASS2),
                                     teaches(INSTRUCTOR, CLASS3),
                                     CLASS1 \= CLASS2,
                                     CLASS2 \= CLASS3,
                                     CLASS3 \= CLASS1.
