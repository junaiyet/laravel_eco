

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>A simple, clean, and responsive HTML invoice template</title>

		<style>
			.invoice-box {
				max-width: 800px;
				margin: auto;
				padding: 30px;
				border: 1px solid #eee;
				box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
				font-size: 16px;
				line-height: 24px;
				font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
				color: #555;
			}

			.invoice-box table {
				width: 100%;
				line-height: inherit;
				text-align: left;
			}

			.invoice-box table td {
				padding: 5px;
				vertical-align: top;
			}

			.invoice-box table tr td:nth-child(2) {
				text-align: right;
			}

			.invoice-box table tr.top table td {
				padding-bottom: 20px;
			}

			.invoice-box table tr.top table td.title {
				font-size: 45px;
				line-height: 45px;
				color: #333;
			}

			.invoice-box table tr.information table td {
				padding-bottom: 40px;
			}

			.invoice-box table tr.heading td {
				background: #eee;
				border-bottom: 1px solid #ddd;
				font-weight: bold;
			}

			.invoice-box table tr.details td {
				padding-bottom: 20px;
			}

			.invoice-box table tr.item td {
				border-bottom: 1px solid #eee;
			}

			.invoice-box table tr.item.last td {
				border-bottom: none;
			}

			.invoice-box table tr.total td {
				border-top: 2px solid #eee;
				font-weight: bold;
			}

			@media only screen and (max-width: 600px) {
				.invoice-box table tr.top table td {
					width: 100%;
					display: block;
					text-align: center;
				}

				.invoice-box table tr.information table td {
					width: 100%;
					display: block;
					text-align: center;
				}
			}

			/** RTL **/
			.invoice-box.rtl {
				direction: rtl;
				font-family: Tahoma, 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
			}

			.invoice-box.rtl table {
				text-align: right;
			}

			.invoice-box.rtl table tr td:nth-child(2) {
				text-align: left;
			}
		</style>
	</head>

	<body>
		<div class="invoice-box">
			<table cellpadding="0" cellspacing="0">
				<tr class="top">
					<td colspan="4">
						<table>
							<tr>
								<td class="title">
									<img src="https://i.postimg.cc/jqM5f106/logo-1x.png" style="width: 100%; max-width: 200px" />
								</td>

								<td>
									Invoice #: {{$order_id}}<br />
									Created: {{ App\Models\Order::where('id',$order_id)->first()->created_at->format('d-M-Y') }}<br />
									{{-- Due: February 1, 2015 --}}
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<tr class="information">
					<td colspan="4">
						<table>
							<tr>
								<td style="width: 200px;">
                                    {{ App\Models\BillingDetails::where('order_id',$order_id)->first()->address }}

								</td>

								<td>
                                    {{ App\Models\BillingDetails::where('order_id',$order_id)->first()->company }}<br />
                                    {{ App\Models\BillingDetails::where('order_id',$order_id)->first()->name }}<br />
                                    {{ App\Models\BillingDetails::where('order_id',$order_id)->first()->email }}
								</td>
							</tr>
						</table>
					</td>
				</tr>




				<tr class="heading " style="text-align:left">
					<td>Item</td>
					<td style="text-align:left">Price</td>
					<td>Qty</td>

					<td>Sub Total</td>
				</tr>
                @php
                    $sub_total = 0 ;
                @endphp
          @foreach ( App\Models\OrderProduct::where('order_id', $order_id)->get() as $order)

          <tr class="item" style="text-align:left">
            <td style="text-align:left">{{$order->rel_to_product->product_name}} </td>
            <td style="text-align:left">{{$order->price}}</td>
            <td style="text-align:left"> {{$order->quantity}}</td>

            <td>{{$order->price * $order->quantity}}</td>
        </tr>
        @php
        $sub_total +=$order->price * $order->quantity ;
    @endphp
        @endforeach
				<tr class="total" style="text-align:left">
					<td></td>
					<td></td>
					<td style="text-align:center">Sub Total</td>

					<td style="font-weight: bold;">{{ $sub_total}}</td>
				</tr>
				<tr class="total" style="text-align:left">
					<td></td>
					<td></td>
					<td style="text-align:center">Discount</td>

					<td style="font-weight: bold;"> {{ App\Models\Order::where('id',$order_id)->first()->discount }}</td>
				</tr>
				<tr class="total" style="text-align:left">
					<td></td>
					<td></td>
					<td style="text-align:center">Charge</td>

					<td style="font-weight: bold;"> {{ App\Models\Order::where('id',$order_id)->first()->charge }}</td>
				</tr>
				<tr class="total" style="text-align:left">
					<td></td>
					<td></td>
					<td style="text-align:center">Grand Total</td>

					<td style="font-weight: bold;"> {{ App\Models\Order::where('id',$order_id)->first()->total }}</td>
				</tr>

			</table>
		</div>
	</body>
</html>
