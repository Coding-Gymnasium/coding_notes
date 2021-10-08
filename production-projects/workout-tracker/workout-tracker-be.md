# Workout Tracker BE

## Summary

The workout tracker will track a lifter's workout by collecting a video for certain lifts per workout.

The lifter can login using a google account (auth)

A lifter can create a workout log and date it.

The lifter selects a lift from a list (dropdown menu) and uploads a video (optional).

The lifter can add notes to the lift (optional).

## Technical details

The back end is developed on NestJS
It servers APIs to a client
The database is postgresql

## Schema

### User

- name
- email

### Log

- user_id
- exercise_id
- video
- notes
- date

### Exercise

- name

## Steps to Build

1. `yarn global add @nestjs/cli`
2. `nest new w-tracker-be`
3.
