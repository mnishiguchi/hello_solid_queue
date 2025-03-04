# hello_solid_queue

A demo Rails 8.0 application that showcases how to use **[SolidQueue](https://github.com/basecamp/solid-queue)** and **[Mission Control Jobs](https://github.com/basecamp/mission-control-jobs)** for background job processing without Redis.

## Requirements

- **Docker & Docker Compose** (for containerized development)
- **Ruby 3.4** (if running locally)
- **Rails 8.0**
- **PostgreSQL** (used for both app data and SolidQueue)

## Setup

Clone the repository and navigate into the project directory:

```sh
git clone https://github.com/mnishiguchi/hello_solid_queue.git
cd hello_solid_queue
```

Start the application using **Docker Compose**:

```sh
docker compose up --build
```

Run database migrations:

```sh
docker compose run --rm web rails db:prepare
```

Once the setup is complete, visit the app at:

- **http://localhost:3000** – Home page with job triggers
- **http://localhost:3000/jobs** – SolidQueue dashboard
- **http://localhost:3000/letter_opener** – View sent emails

## How to Use

### Trigger Background Jobs

On the home page, you can select and trigger different types of jobs:

- **High-Priority Job**: A job enqueued with high priority to execute faster.  
- **Delayed Job**: Runs after 5 minutes.  
- **Failing Job**: A job that fails immediately for testing failure handling.  
- **Failing Retry Job**: A job that intentionally fails but retries with exponential backoff.  

*Recurring jobs run automatically on a schedule and do not require manual triggering.*

### Register to Receive Emails

Fill in your name and submit the form to receive a welcome email.

### Monitor Jobs

Access the **SolidQueue dashboard** to track job statuses.

**Admin credentials for the dashboard**:

```
Username: admin
Password: password
```

### View Sent Emails

Use [Letter Opener](http://localhost:3000/letter_opener) to check outgoing emails during development.
