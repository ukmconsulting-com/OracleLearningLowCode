--create sequence
create sequence team_member_seq;

-- create table
create table team_member (
    id                             number default on null team_member_seq.NEXTVAL 
                                   constraint team_member_id_pk primary key,
    username                       varchar2(255 char) not null,
    full_name                      varchar2(255 char),
    email                          varchar2(255 char) not null,
    phone_number                   number,
    profile                        varchar2(4000 char),
    photo                          blob,
    photo_filename                 varchar2(512 char),
    photo_mimetype                 varchar2(512 char),
    photo_charset                  varchar2(512 char),
    photo_lastupd                  date,
    created                        date not null,
    created_by                     varchar2(255 char) not null,
    updated                        date not null,
    updated_by                     varchar2(255 char) not null
)
;


-- triggers
create or replace trigger team_member_biu
    before insert or update 
    on team_member
    for each row
begin
    if inserting then
        :new.created := sysdate;
        :new.created_by := coalesce(sys_context('APEX$SESSION','APP_USER'),user);
    end if;
    :new.updated := sysdate;
    :new.updated_by := coalesce(sys_context('APEX$SESSION','APP_USER'),user);
    :new.username := lower(:new.username);
end team_member_biu;
/
