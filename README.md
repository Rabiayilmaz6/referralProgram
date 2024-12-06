# README

* Overview
This repository implements a referral program that allows users to invite others to the system using unique referral codes. The referral program is designed to reward both the inviter (Davetçi) and the invitee (Davet edilen) based on specific credit loading thresholds. This document describes the architecture, functionality, and implementation details.

* Features
Unique Referral Codes: Each inviter has a unique referral code that can be shared with others.
Invitee Registration: Invitees can use a referral code during registration to associate themselves with an inviter.
Inviter Management: Invited users are tracked in a list associated with their inviter.
Credit Rewards: Both invitees and inviters receive rewards based on credit loading amounts.

* Workflow
User Registration with Referral Code:

A new user enters a referral code during registration.
The system validates the referral code and associates the new user with the inviter.
Adding to Inviter's List:

The invitee is added to the inviter's invited_users list.
Credit Loading:

The invitee loads credits to their account.
The system calculates rewards for both the invitee and the inviter based on the Credit Rewards table.
Reward Distribution:

Rewards are stored in the Referral model, linked to the respective referral relationship.