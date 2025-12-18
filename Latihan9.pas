program cyptoWallet;
uses crt;

var
        selesai : boolean;
        pilihan, pilihanDeposit, pilihanWithdraw, pilihanStake, tukarDari, tukarKe, hariStaking, sisaHari, sisaBulan : integer;
        i, j : integer;
        BTC, ETH, BNB, SOL, USDT, depoAset, WdAset, jumlahTukar, hasilJumlahTukar, jumlahStake, imbalan : real;
        hargaBTC, hargaETH, hargaBNB, hargaSOL, hargaUSDT, asetDolarBTC, asetDolarETH, asetDolarBNB, asetDolarSOL, asetDolarUSDT : real;
        hargaTokenAwal, hargaTokenTujuan, totalAset, hargaUSD : real;
        namaToken, tokenAwal, tokenTujuan : string;


begin
        clrscr;

        selesai := false;
        BTC := 0;
        ETH := 0;
        BNB := 0;
        SOL := 0;
        USDT := 0;
        
        hargaBTC := 90352;
        hargaETH := 2921;
        hargaBNB := 945;
        hargaSOL := 134;
        hargaUSDT := 1;

        repeat

        asetDolarBTC := BTC * hargaBTC;
        asetDolarETH := ETH * hargaETH;
        asetDolarBNB := BNB * hargaBNB;
        asetDolarSOL := SOL * hargaSOL;
        asetDolarUSDT := USDT * hargaUSDT;

        writeln('============Dompet Kripto Anda===========');
        writeln(BTC:0:2,' BTC = $', asetDolarBTC:0:2);
        writeln(ETH:0:2,' ETH = $', asetDolarETH:0:2);
        writeln(BNB:0:2,' BNB = $', asetDolarBNB:0:2);
        writeln(SOL:0:2,' SOL = $', asetDolarSOL:0:2);
        writeln(USDT:0:2,' USDT = $', asetDolarUSDT:0:2);
        writeln('-------------Kurs Harga Kripto-----------');
        writeln('BTC/USD = $90352');
        writeln('ETH/USD = $2921');
        writeln('BNB/USD = $945');
        writeln('SOL/USD = $134');
        writeln('USDT/USD = $1');
        writeln('==================Fitur==================');
        writeln('1. Deposit Assets');
        writeln('2. Withdraw Assets');
        writeln('3. Swap Assets');
        writeln('4. Staking Assets');
        writeln('5. Akhiri Program');
        writeln('=========================================');
        write('Masukkan pilihan Anda : ');
        readln(pilihan);
        writeln('');

        case pilihan of
                1 :
                        begin

                                writeln('==========================================');
                                writeln('1. Bitcoin       ($BTC)');
                                writeln('2. Ethereum      ($ETH)');
                                writeln('3. Binance Coin  ($BNB)');
                                writeln('4. Solana        ($SOL)');
                                writeln('5. USD Tether    ($USDT)');
                                writeln('==========================================');
                                write('Anda ingin deposit aset yang mana (1-5) : ');
                                readln(pilihanDeposit);
                                writeln('------------------------------------------');

                                case pilihanDeposit of
                                        1 : namaToken := 'BTC';
                                        2 : namaToken := 'ETH';
                                        3 : namaToken := 'BNB';
                                        4 : namaToken := 'SOL';
                                        5 : namaToken := 'USDT';
                                        else
                                        begin
                                                writeln('');
                                                writeln('================DEPOSIT GAGAL===============');
                                                writeln('Pilihan aset tidak ada di tabel');
                                                writeln('============================================');
                                                writeln('');
                                                writeln('');
                                                writeln('');
                                                namaToken := 'Invalid';
                                        end;
                                end;

                                if namaToken <> 'Invalid' then
                                begin
                                        write('Masukkan jumlah ', namaToken,' yang ingin anda depositkan : ');
                                        readln(depoAset);

                                        if depoAset < 0 then
                                        begin
                                                writeln('');
                                                writeln('================DEPOSIT GAGAL===============');
                                                writeln('Deposit tidak boleh di bawah 0');
                                                writeln('============================================');
                                                writeln('');
                                                writeln('');
                                                writeln('');
                                        end

                                        else if depoAset = 0 then
                                        begin
                                                writeln('');
                                                writeln('================DEPOSIT GAGAL===============');
                                                writeln('Deposit harus diisi');
                                                writeln('============================================');
                                                writeln('');
                                                writeln('');
                                                writeln('');
                                        end

                                        else 
                                        begin
                                                case pilihanDeposit of
                                                        1 : BTC := BTC + depoAset;
                                                        2 : ETH := ETH + depoAset;
                                                        3 : BNB := BNB + depoAset;
                                                        4 : SOL := SOL + depoAset;
                                                        5 : USDT := USDT + depoAset;
                                                end;
                                                writeln('');
                                                writeln('Memproses deposit pada aset Anda');

                                                for i:=1 to 3 do
                                                begin
                                                        write('Tahap deposit ', i, '/3: ');

                                                        for j:=1 to 10 do
                                                        begin
                                                                write('.');
                                                                delay(100);
                                                        end;
                                                        writeln(' SELESAI');
                                                        delay(100);
                                                end;

                                                writeln('Proses deposit berhasil!'); delay(100);
                                                writeln('');
                                                writeln('===============DEPOSIT SELESAI==============');
                                                writeln('Anda berhasil deposit ', depoAset:0:2, ' ', namaToken);
                                                writeln('============================================');
                                                writeln('');
                                                writeln('');
                                                writeln('');
                                        end;
                                end;
                        end;
                2 :
                        begin

                                writeln('========================');
                                writeln('1. Bitcoin       ($BTC)');
                                writeln('2. Ethereum      ($ETH)');
                                writeln('3. Binance Coin  ($BNB)');
                                writeln('4. Solana        ($SOL)');
                                writeln('5. USD Tether    ($USDT)');
                                writeln('========================');
                                write('Anda ingin tarik aset yang mana (1-5) : ');
                                readln(pilihanWithdraw);
                                writeln('----------------------------------------');

                                case pilihanWithdraw of
                                1 :
                                        begin
                                        namaToken := 'BTC';
                                        totalAset := BTC;
                                        end;

                                2 :
                                        begin
                                        namaToken := 'ETH';
                                        totalAset := ETH;
                                        end;
                                3 :
                                        begin
                                        namaToken := 'BNB';
                                        totalAset := BNB;
                                        end;
                                4 :
                                        begin
                                        namaToken := 'SOL';
                                        totalAset := SOL;
                                        end;
                                5 :
                                        begin
                                        namaToken := 'USDT';
                                        totalAset := USDT;
                                        end;
                                else
                                        begin
                                                writeln('');
                                                writeln('==================PENARIKAN GAGAL================');
                                                writeln('Aset tidak ada di tabel');
                                                writeln('=================================================');
                                                writeln('');
                                                writeln('');
                                                writeln('');
                                                namaToken := 'Invalid';
                                        end;
                                end;

                                if namaToken <> 'Invalid' then
                                begin
                                        if totalAset = 0 then
                                        begin
                                                writeln('');
                                                writeln('==================PENARIKAN GAGAL================');
                                                writeln('Anda tidak memiliki aset');
                                                writeln('=================================================');
                                                writeln('');
                                                writeln('');
                                                writeln('');
                                        end

                                        else
                                        begin
                                                writeln('(Jumlah penarikan tidak boleh lebih besar dari total aset Anda)');
                                                write('Masukkan jumlah ', namaToken, ' yang ingin anda lakukan penarikan : ');
                                                readln(WdAset);
                                                if WdAset > totalAset then
                                                begin
                                                        writeln('');
                                                        writeln('=================PENARIKAN GAGAL=================');
                                                        writeln('Anda tidak memiliki aset yang cukup untuk ditarik');
                                                        writeln('Anda gagal menarik ', WdAset:0:2, ' ', namaToken);
                                                        writeln('=================================================');
                                                        writeln('');
                                                        writeln('');
                                                        writeln('');
                                                end
                                                else
                                                begin
                                                        totalAset := totalAset - WdAset;
                                                        writeln('');
                                                        writeln('Memproses penarikan pada aset Anda');

                                                        for i:=1 to 3 do
                                                        begin
                                                                write('Tahap penarikan ', i, '/3: ');

                                                                for j:=1 to 10 do
                                                                        begin
                                                                        write('.');
                                                                        delay(100);
                                                                end;
                                                                writeln(' SELESAI');
                                                                delay(100);
                                                        end;

                                                        writeln('Proses penarikan berhasil!'); delay(100);
                                                        writeln('');
                                                        writeln('=============PENARIKAN SELESAI=============');
                                                        writeln('Anda berhasil menarik ', WdAset:0:2, ' ', namaToken);
                                                        writeln('===========================================');
                                                        writeln('');
                                                        writeln('');
                                                        writeln('');
                                                        
                                                        case pilihanWithdraw of
                                                        1 : BTC := totalAset;
                                                        2 : ETH := totalAset;
                                                        3 : BNB := totalAset;
                                                        4 : SOL := totalAset;
                                                        5 : USDT := totalAset;
                                                        end
                                                end;
                                        end;
                                end;
                        end;    
                3 :
                        begin

                                writeln('========================');
                                writeln('1. Bitcoin       ($BTC)');
                                writeln('2. Ethereum      ($ETH)');
                                writeln('3. Binance Coin  ($BNB)');
                                writeln('4. Solana        ($SOL)');
                                writeln('5. USD Tether    ($USDT)');
                                writeln('========================');
                                write('Anda ingin tukar aset yang mana? (1-5) : ');
                                readln(tukarDari);
                                writeln('------------------------');
                                write('Anda ingin tukar ke aset mana? (1-5) : ');
                                readln(tukarKe);
                                writeln('');

                                if tukarDari = tukarKe then
                                begin
                                        writeln('');
                                        writeln('============PENUKARAN GAGAL============');
                                        writeln('Tidak boleh menukar ke aset yang sama');
                                        writeln('=======================================');
                                        writeln('');
                                        writeln('');
                                        writeln('');
                                end 

                                else
                                        begin
                                        case tukarDari of
                                        1 :
                                                begin

                                                tokenAwal := 'BTC';
                                                hargaTokenAwal := hargaBTC;
                                                totalAset := BTC;

                                                end;
                                        2 :
                                                begin

                                                tokenAwal := 'ETH';
                                                hargaTokenAwal := hargaETH;
                                                totalAset := ETH;

                                                end;
                                        3 :
                                                begin

                                                tokenAwal := 'BNB';
                                                hargaTokenAwal := hargaBNB;
                                                totalAset := BNB;

                                                end;
                                        4 :
                                                begin

                                                tokenAwal := 'SOL';
                                                hargaTokenAwal := hargaSOL;
                                                totalAset := SOL;

                                                end;
                                        5 :
                                                begin

                                                tokenAwal := 'USDT';
                                                hargaTokenAwal := hargaUSDT;
                                                totalAset := USDT;

                                                end;
                                        else
                                                begin
                                                        writeln('');
                                                        writeln('============PENUKARAN GAGAL============');
                                                        writeln('Aset yang ditukar tidak ada di tabel');
                                                        writeln('=======================================');
                                                        writeln('');
                                                        writeln('');
                                                        writeln('');
                                                        tokenAwal := 'Invalid';
                                                end;
                                        end;

                                        case tukarKe of
                                        1 :
                                                begin

                                                tokenTujuan := 'BTC';
                                                hargaTokenTujuan := hargaBTC;

                                                end;
                                        2 :
                                                begin

                                                tokenTujuan := 'ETH';
                                                hargaTokenTujuan := hargaETH;

                                                end;
                                        3 :
                                                begin

                                                tokenTujuan := 'BNB';
                                                hargaTokenTujuan := hargaBNB;

                                                end;
                                        4 :
                                                begin

                                                tokenTujuan := 'SOL';
                                                hargaTokenTujuan := hargaSOL;

                                                end;
                                        5 :
                                                begin

                                                tokenTujuan := 'USDT';
                                                hargaTokenTujuan := hargaUSDT;

                                                end;
                                        else
                                                begin
                                                        writeln('');
                                                        writeln('============PENUKARAN GAGAL============');
                                                        writeln('Tujuan aset tidak ada di tabel');
                                                        writeln('=======================================');
                                                        writeln('');
                                                        writeln('');
                                                        writeln('');
                                                        tokenTujuan := 'Invalid';
                                                end;
                                        end;

                                        if (tokenAwal <> 'Invalid') and (tokenTujuan <> 'Invalid') then
                                        begin
                                                write('Masukkan jumlah ', tokenAwal, ' : ');
                                                readln(jumlahTukar);

                                                if jumlahTukar > totalAset then
                                                begin
                                                        writeln('');
                                                        writeln('============PENUKARAN GAGAL============');
                                                        writeln('Aset yang Anda tukar tidak cukup');
                                                        writeln('Anda gagal menukar ', jumlahTukar:0:2, ' ', tokenAwal);
                                                        writeln('=======================================');
                                                        writeln('');
                                                        writeln('');
                                                        writeln('');
                                                end

                                                else
                                                begin
                                                        hargaUSD := jumlahTukar * hargaTokenAwal;
                                                        hasilJumlahTukar := hargaUSD / hargaTokenTujuan;

                                                        case tukarDari of
                                                                1 : BTC := BTC - jumlahTukar;
                                                                2 : ETH := ETH - jumlahTukar;
                                                                3 : BNB := BNB - jumlahTukar;
                                                                4 : SOL := SOL - jumlahTukar;
                                                                5 : USDT := USDT - jumlahTukar;
                                                        end;

                                                        case tukarKe of
                                                                1 : BTC := BTC + hasilJumlahTukar;
                                                                2 : ETH := ETH + hasilJumlahTukar;
                                                                3 : BNB := BNB + hasilJumlahTukar;
                                                                4 : SOL := SOL + hasilJumlahTukar;
                                                                5 : USDT := USDT + hasilJumlahTukar;
                                                        end;
                                                        writeln('');
                                                        writeln('Memproses penukaran pada aset Anda');

                                                        for i:=1 to 3 do
                                                        begin
                                                                write('Tahap penukaran ', i, '/3: ');

                                                                for j:=1 to 10 do
                                                                        begin
                                                                        write('.');
                                                                        delay(100);
                                                                end;
                                                                writeln(' SELESAI');
                                                                delay(100);
                                                        end;

                                                        writeln('Proses penukaran berhasil!'); delay(100);

                                                        writeln('');
                                                        writeln('===========PENUKARAN BERHASIL===========');
                                                        writeln('Anda berhasil menukar ', jumlahTukar:0:2, ' ', tokenAwal, ' => ', hasilJumlahTukar:0:2, ' ', tokenTujuan);
                                                        writeln('========================================');
                                                        writeln('');
                                                        writeln('');
                                                        writeln('');
                                                end;
                                        end;
                                end;
                        end;
                4 :
                        begin
                                writeln('========================');
                                writeln('Stake aset (APY 7%)');
                                writeln('------------------------');
                                writeln('1. Bitcoin       ($BTC)');
                                writeln('2. Ethereum      ($ETH)');
                                writeln('3. Binance Coin  ($BNB)');
                                writeln('4. Solana        ($SOL)');
                                writeln('5. USD Tether    ($USDT)');
                                writeln('========================');
                                write('Anda ingin stake aset yang mana? (1-5) : ');
                                readln(pilihanStake);
                                writeln('------------------------');
                                writeln('');
                                case pilihanStake of
                                1 :
                                        begin
                                        namaToken := 'BTC';
                                        totalAset := BTC;
                                        end;

                                2 :
                                        begin
                                        namaToken := 'ETH';
                                        totalAset := ETH;
                                        end;
                                3 :
                                        begin
                                        namaToken := 'BNB';
                                        totalAset := BNB;
                                        end;
                                4 :
                                        begin
                                        namaToken := 'SOL';
                                        totalAset := SOL;
                                        end;
                                5 :
                                        begin
                                        namaToken := 'USDT';
                                        totalAset := USDT;
                                        end;
                                else
                                        begin
                                                writeln('');
                                                writeln('===================STAKING GAGAL=================');
                                                writeln('Aset tidak ada di tabel');
                                                writeln('=================================================');
                                                writeln('');
                                                writeln('');
                                                writeln('');
                                                namaToken := 'Invalid';
                                        end;
                                end;

                                if namaToken <> 'Invalid' then
                                begin
                                        write('Masukan jumlah ', namaToken, ' yang ingin di-stake : ');
                                        readln(jumlahStake);

                                        if jumlahStake < 0 then
                                        begin
                                                writeln('');
                                                writeln('====================STAKING GAGAL==================');
                                                writeln('Jumlah stake tidak boleh dibawah 0');
                                                writeln('===================================================');
                                                writeln('');
                                                writeln('');
                                                writeln('');
                                        end

                                        else if jumlahStake = 0 then
                                        
                                        begin
                                                writeln('');
                                                writeln('====================STAKING GAGAL==================');
                                                writeln('Jumlah stake harus diisi');
                                                writeln('===================================================');
                                                writeln('');
                                                writeln('');
                                                writeln('');
                                        end

                                        else if jumlahStake > totalAset then
                                        
                                        begin
                                                writeln('');
                                                writeln('====================STAKING GAGAL==================');
                                                writeln('Jumlah stake lebih besar dari aset yang Anda miliki');
                                                writeln('===================================================');
                                                writeln('');
                                                writeln('');
                                                writeln('');
                                        end

                                        else
                                        begin
                                                hariStaking := 0;
                                                writeln('===================================================');
                                                writeln('Periode staking minimal 30 hari');

                                                while hariStaking < 30 Do
                                                begin
                                                        write('Masukkan periode staking (dalam hari) : ');
                                                        readln(hariStaking);
                                                        writeln('');
                                                        if hariStaking < 30 then
                                                        writeln('Periode staking minimal 30 hari');
                                                end;

                                                writeln('===================================================');

                                                case pilihanStake of
                                                1 : BTC := BTC - jumlahStake;
                                                2 : ETH := ETH - jumlahStake;
                                                3 : BNB := BNB - jumlahStake;
                                                4 : SOL := SOL - jumlahStake;
                                                5 : USDT := USDT - jumlahStake;
                                                end;

                                                writeln('');
                                                writeln('Memproses penguncian pada aset Anda');

                                                for i:=1 to 3 do
                                                begin
                                                        write('Tahap konfirmasi ', i, '/3: ');

                                                        for j:=1 to 10 do
                                                        begin
                                                                write('.');
                                                                delay(100);
                                                        end;
                                                        writeln(' SELESAI');
                                                        delay(100);
                                                end;

                                                writeln('Proses penguncian berhasil!'); delay(100);

                                                writeln('');
                                                writeln('');
                                                writeln('');
                                                writeln('Menghitung kalkulasi reward Anda');

                                                for i:=1 to 3 do
                                                begin
                                                        write('Tahap kalkulasi ', i, '/3: ');

                                                        for j:=1 to 10 do
                                                        begin
                                                                write('.');
                                                                delay(100);
                                                        end;
                                                        writeln(' SELESAI');
                                                        delay(100);
                                                end;

                                                writeln('Proses kalkulasi berhasil!'); delay(100);

                                                sisaBulan := hariStaking DIV 30;
                                                sisaHari := hariStaking MOD 30;
                                                imbalan := jumlahStake * (0.07 / 365) * hariStaking;

                                                writeln('');
                                                writeln('==================STAKING BERHASIL================='); delay(100);
                                                writeln(jumlahStake:0:2, ' ', namaToken, ' berhasil di-stake'); delay(100);
                                                writeln('Estimasi penguncian adalah : ', sisaBulan, ' bulan ', sisaHari, ' hari lagi'); delay(100);
                                                writeln('Perkiraan reward adalah : ', imbalan:0:2, ' ', namaToken, ' setelah ', hariStaking, ' hari'); delay(100);
                                                writeln('==================================================='); delay(500);
                                                writeln('');
                                                writeln('');
                                                writeln('');
                                        end;
                                end;


                        end;

                5 : selesai := true;

                else
                writeln('Fitur tidak ada di dalam tabel');
                writeln('');
                writeln('');
                writeln('');

        end;

        until selesai = true;
        halt;
        readln;
end.