defmodule PhoenixExample.CronScheduler do
  use Quantum.Scheduler,
    otp_app: :phoenix_example
end
