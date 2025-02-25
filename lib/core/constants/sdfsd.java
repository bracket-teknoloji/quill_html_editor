public boolean ozelKod1TablodanMi() {
  //tablodan ise rehberden seçilir, değilse combobox şeklinde gelir.
  boolean satisMi = BelgeUtils.belgeSatisMi(_BelgeTuru) || BelgeUtils.datMi(_BelgeTuru) || BelgeUtils.ambarMi(_BelgeTuru);
  boolean alisMi = BelgeUtils.belgeAlisMi(_BelgeTuru);
  if (satisMi)
   return SatisOzelKod1Tablodan;
  else if (alisMi)
   return AlisOzelKod1Tablodan;
  else if (BelgeUtils.talepTeklifMi(_BelgeTuru))
   return _getTalTekParamModel(_BelgeTuru).OZEL_KOD1_TABLODAN.equalsIgnoreCase("E");
  else
   return false;
 }
_dialogBinderOzelKod1._initKeyGizle = true;
   for (OzelKodResponseModel m : _paramModel.getOzelKod1List()) {
    _dialogBinderOzelKod1.addItem(m.Kod, m.getKodAciklama(), m, false);
   }
   if (_yeniKayitMi && _paramModel.ozelKod1TablodanMi() == false) {
    _dialogBinderOzelKod1.selectFirst();
   }