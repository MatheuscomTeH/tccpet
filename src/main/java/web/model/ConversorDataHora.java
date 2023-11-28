package web.model;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ConversorDataHora {

    // Método para converter String para Date
    public static Date converterStringParaData(String dataString) {
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            return formatter.parse(dataString);
        } catch (ParseException e) {
            e.printStackTrace(); // Trate a exceção de acordo com sua lógica
            return null;
        }
    }

    // Método para converter String para Time
    public static Date converterStringParaHora(String horaString) {
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("HH:mm");
            return formatter.parse(horaString);
        } catch (ParseException e) {
            e.printStackTrace(); // Trate a exceção de acordo com sua lógica
            return null;
        }
    }

    public static void main(String[] args) {
        // Exemplo de uso
        String dataString = "2023-11-15";
        String horaString = "13:12";

        Date dataConvertida = converterStringParaData(dataString);
        Date horaConvertida = converterStringParaHora(horaString);

        System.out.println("Data convertida: " + dataConvertida);
        System.out.println("Hora convertida: " + horaConvertida);
    }
}
