defmodule Zipcloudx do

  @doc """
  Fetch zipcloud API
  """
  def request(zipcode) do
    get("http://zipcloud.ibsnet.co.jp/api/search", [zipcode: zipcode])
  end

  defp get(url, [zipcode: zipcode]) do
    HTTPoison.start
    url = "#{url}?zipcode=#{zipcode}"
    HTTPoison.get!(url, [])
    |> handle_response
  end

  defp handle_response(%HTTPoison.Response{body: body, status_code: code}) when code in 200..299 do
    json = Poison.decode!(body)
    response = %Zipcloudx.Response{
      status: json["status"],
      message: json["message"],
      address: decode_results(json["results"])
    }
    case response.status do
      status when status in 200..299 ->
        {:ok, response}
      _ ->
        IO.puts response.status
        {:error, response}
    end
  end

  defp decode_results(nil), do: nil
  defp decode_results(results) when is_list(results) do
    Enum.map(results, &decode_result/1)
  end

  defp decode_result(result) do
    %Zipcloudx.Address{
      zipcode: result["zipcode"],
      prefcode: result["prefcode"],
      address1: result["address1"],
      address2: result["address2"],
      address3: result["address3"],
      kana1: result["kana1"],
      kana2: result["kana2"],
      kana3: result["kana3"]
    }
  end
end
