const toplamTutarHesapla = () =>{
    let birimFiyati = document.getElementById('BirimFiyati').value;
    let miktar = document.getElementById('Miktar').value;
    document.getElementById('ToplamTutarSonuc').textContent = birimFiyati*miktar+" TL";
  }

  const indirimliToplamTutarHesapla = (input) =>{
    let IndirimYuzde = document.getElementById('IndirimYuzde').value;
    let IndirimTutari = document.getElementById('IndirimTutari').value;
    let ToplamTutarSonuc = document.getElementById('ToplamTutarSonuc').textContent;
    let İndirimliToplamTutarSonuc = document.getElementById('İndirimliToplamTutarSonuc').textContent;

    if(input.getAttribute("id") === "IndirimYuzde"){

      document.getElementById('İndirimliToplamTutarSonuc').textContent = Math.abs(((Number(ToplamTutarSonuc.substring(0,ToplamTutarSonuc.length-3))*Number(IndirimYuzde))/100)-Number(ToplamTutarSonuc.substring(0,ToplamTutarSonuc.length-3))) +" TL";

      document.getElementById('IndirimTutari').value = Number(ToplamTutarSonuc.substring(0,ToplamTutarSonuc.length-3))*Number(IndirimYuzde)/100;
      
    }else if(input.getAttribute("id") === "IndirimTutari"){

      document.getElementById('İndirimliToplamTutarSonuc').textContent = Number(ToplamTutarSonuc.substring(0,ToplamTutarSonuc.length-3))-Number(IndirimTutari) +" TL";


      document.getElementById('IndirimYuzde').value = ((Number(ToplamTutarSonuc.substring(0,ToplamTutarSonuc.length-3))-(Number(ToplamTutarSonuc.substring(0,ToplamTutarSonuc.length-3))-Number(IndirimTutari)))/Number(ToplamTutarSonuc.substring(0,ToplamTutarSonuc.length-3)))*100;

    }
  }


  const KdvliToplamTutarSonuc = (input) =>{
    
    let İndirimliToplamTutarSonuc = document.getElementById('İndirimliToplamTutarSonuc').textContent;
    let KdvYuzde = document.getElementById('KdvYuzde').value;
    let KdvTutari = document.getElementById('KdvTutari').value;

    if(input.getAttribute("id") === "KdvYuzde"){

      document.getElementById('KdvliToplamTutarSonuc').textContent = Number(İndirimliToplamTutarSonuc.substring(0,İndirimliToplamTutarSonuc.length-3))+((Number(İndirimliToplamTutarSonuc.substring(0,İndirimliToplamTutarSonuc.length-3))*Number(KdvYuzde))/100) +" TL";

      document.getElementById('KdvTutari').value = (Number(İndirimliToplamTutarSonuc.substring(0,İndirimliToplamTutarSonuc.length-3))*Number(KdvYuzde))/100;

    }else if(input.getAttribute("id") === "KdvTutari"){

      document.getElementById('KdvliToplamTutarSonuc').textContent = Number(İndirimliToplamTutarSonuc.substring(0,İndirimliToplamTutarSonuc.length-3))+Number(KdvTutari) +" TL";


      document.getElementById('KdvYuzde').value = ((Number(İndirimliToplamTutarSonuc.substring(0,İndirimliToplamTutarSonuc.length-3))-(Number(İndirimliToplamTutarSonuc.substring(0,İndirimliToplamTutarSonuc.length-3))-Number(KdvTutari)))/Number(İndirimliToplamTutarSonuc.substring(0,İndirimliToplamTutarSonuc.length-3)))*100;

    }

  }