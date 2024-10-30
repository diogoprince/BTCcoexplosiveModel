Dbitcoin=diff(bitcoin,1);
Dgoogle=diff(google,1);
Drbitcoin=bitcoin-1.034*lag(bitcoin,1);
Drgoogle=google-1.034*lag(google,1);
DDrgoogle=diff(Drgoogle, 1);
DDrbitcoin=diff(Drbitcoin, 1);