if (fiyatRehberGorebilir()) {
			if (!_paramModel.OzelFiyatSistemi) {
				if (_initStokResponseModel.dovizliMi(_satisaYonelikMi)) {
					b.layoutDovizFiyati.setRightImageResource(R.drawable.ic_rehber_gray, new OneClickListener() {
						@Override
						public void onOneClick(View v) {
							b.layoutBrutFiyatTL.setRightImageResource(0);
							showFiyatSecDialog(b.layoutDovizFiyati);
						}
					});
				} else {
					b.layoutBrutFiyatTL.setRightImageResource(R.drawable.ic_rehber_gray, new OneClickListener() {
						@Override
						public void onOneClick(View v) {
							b.layoutDovizFiyati.setRightImageResource(0);
							showFiyatSecDialog(b.layoutBrutFiyatTL);
						}
					});
				}
			} else { // APK 233
				b.layoutBrutFiyatTL.setRightImageResource(R.drawable.ic_rehber_gray, new OneClickListener() {
					@Override
					public void onOneClick(View v) {
						b.layoutDovizFiyati.setRightImageResource(0);
						showListeFiyatSecDialog(b.layoutBrutFiyatTL);
					}
				});
			}
		}
