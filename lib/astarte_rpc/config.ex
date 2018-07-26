#
# This file is part of Astarte.
#
# Astarte is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Astarte is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Astarte.  If not, see <http://www.gnu.org/licenses/>.
#
# Copyright (C) 2017 Ispirata Srl
#

defmodule Astarte.RPC.Config do
  @moduledoc """
  This module helps the access to the runtime configuration of Astarte RPC
  """

  @doc """
  Returns the amqp_connection options or an empty list if they're not set.
  """
  def amqp_options do
    Application.get_env(:astarte_rpc, :amqp_connection, [])
  end

  @doc """
  Returns the amqp prefetch count. Defaults to 300.
  """
  def amqp_prefetch_count do
    Application.get_env(:astarte_rpc, :amqp_prefetch_count, 300)
  end

  def amqp_queue_arguments do
    max_length = Application.get_env(:astarte_rpc, :amqp_queue_max_length)
    if is_integer(max_length) and max_length > 0 do
      [{:"x-max-length", max_length}, {:"x-overflow", "reject-publish"}]
    else
      []
    end
  end
end
