defmodule PhoenixExample.ElasticsearchCluster do
  @moduledoc """
  The ElasticSearch handler
  """
  ## copy from https://hexdocs.pm/elasticsearch/readme.html
  use Elasticsearch.Cluster, otp_app: :phoenix_example
end
