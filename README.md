# Referral Program

This project implements a referral program that allows users to invite others to the platform using unique referral codes. Both the inviter (`Davetçi`) and invitee (`Davet edilen`) can earn rewards based on the invitee’s credit loading activity.

---

## Table of Contents

- [Features](#features)
- [How It Works](#how-it-works)
- [Reward System](#reward-system)
  - [Invitee Rewards](#invitee-rewards)
  - [Inviter Rewards](#inviter-rewards)
- [API Endpoints](#api-endpoints)
- [Setup](#setup)
- [Examples](#examples)
- [Future Enhancements](#future-enhancements)
- [License](#license)

---

## Features

- **Unique Referral Codes**: Users can invite others using a unique referral code.
- **Referral Tracking**: Track the relationship between inviter and invitee.
- **Reward Distribution**: Both invitee and inviter earn rewards based on credit loading thresholds.
- **Database Integration**: Rewards are linked to the `Referral` model for accountability and tracking.

---

## How It Works

1. **User Registration with Referral Code**:
   - A new user enters a referral code during registration.
   - The referral code links the invitee to the inviter.

2. **Referral Tracking**:
   - The system validates the referral code and adds the invitee to the inviter's list.

3. **Reward Distribution**:
   - When the invitee loads credits, the inviter and invitee receive rewards according to the thresholds defined in the reward system.

4. **Referral Model**:
   - Rewards are stored in the `Referral` model and linked to the inviter-invitee relationship.

---

## Reward System

### Invitee Rewards
Invitees are rewarded based on the amount of credits they load:

| Credit Load   | Invitee Reward |
|---------------|----------------|
| 0 - 10        | 0              |
| 10 - 50       | 2              |
| 50 - 100      | 4              |
| 100+          | 5              |

### Inviter Rewards
Inviters are rewarded based on the credit load of their invitees:

| Credit Load   | Inviter Reward |
|---------------|----------------|
| 0 - 10        | 1              |
| 10 - 50       | 3              |
| 50 - 100      | 6              |
| 100+          | 10             |

---

## API Endpoints

### **User Registration**
**Endpoint**: `/register`  
**Method**: `POST`  
**Payload**:
```json
{
  "username": "invitee_name",
  "referral_code": "ABC123"
}
