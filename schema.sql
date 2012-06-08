create table Subjects
   (sn                              integer primary key,
    ip              text            not null unique,
    double_dip      integer         not null,
    first_seen_t    integer         not null,
    consented_t     integer,
    completed_t     integer,
    task_version    text);

create table MTurk
   (workerid        text            primary key not null,
    sn              integer
      references Subjects(sn),
      -- When sn is null, this row represents an MTurk worker who
      -- wasn't a subject in this study but who we want to
      -- exclude (because they did a similiar study, presumably).
    hitid           text            not null,
    assignmentid    text            not null);

create table Timing
   (sn             integer          not null
      references Subjects(sn),
    k              text             not null,
    first_sent     integer,
    received       integer,
    primary key (sn, k));

create table D
   (sn             integer          not null
      references Subjects(sn),
    k              text             not null,
    v              text,
    primary key (sn, k));
