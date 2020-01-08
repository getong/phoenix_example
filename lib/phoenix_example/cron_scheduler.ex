defmodule PhoenixExample.CronScheduler do
  @moduledoc """
  The cron task handler
  """
  use Quantum.Scheduler,
    otp_app: :phoenix_example
end
