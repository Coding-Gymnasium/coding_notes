# Workout Tracker BE

## Summary

The workout tracker will track a user's workout logs by collecting a video and notes for each tracked lift. The user can login to a personal account access past logs and create new ones.

- A user can created, updated, or deleted.
- The user can login using a google account (auth)
- A user can create a workout log and date it.
- A log can be created, updated, or deleted.
- The user selects a lift from a list (dropdown menu) and uploads a video (optional).
- A lift can be created, updated or deleted.
- A video can be uploaded or deleted.
- The user can add notes to the lift (optional).
- A note can be created, updated or deleted.

## Technical details

The back end is developed on NestJS
It servers APIs to a client
The database is postgresql

## Schema

### User

- name
- email

### Workout Log

- date

### Exercise Log

- user_id
- workoutLog_id
- exercise_id
- video
- notes

### Exercise

- name

## Steps to Build

1. `$ yarn global add @nestjs/cli`
2. `$ nest new w-tracker-be`

### Install Testing

`$ yarn add @nestjs/testing`

### Generate Users CRUD

`$ nest g resource users`

#### Add createUser and getAllUsers methods
