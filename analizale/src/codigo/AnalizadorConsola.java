package codigo;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.Map;

public class AnalizadorConsola {

    public static void main(String[] args) {
        String nombreArchivo = "C:\\Users\\poky9\\Documents\\NetBeansProjects\\analizale\\src\\codigo\\prueba.txt";
        
        TablaSimbolos tablaSimbolos = new TablaSimbolos();

        try {
            Reader lector = new BufferedReader(new FileReader(nombreArchivo));
            Lexer lexer = new Lexer(lector);
            String resultado = "";
            
            while (true) {
                Tokens tokens = lexer.yylex();
                
                if (tokens == null) {
                    resultado += "FIN";
                    System.out.println(resultado);
                    return;
                }
                
                switch (tokens) {
                    case ERROR -> resultado += "Simbolo no definido\n";
                    case Identificador -> {
                        String identificador = lexer.lexeme;
                        int numeroIdentificador = tablaSimbolos.obtenerNumeroIdentificador(identificador);
                        // Aquí puedes hacer lo que necesites con el número del identificador
                        resultado += tokens + " tiene la posicion: " + numeroIdentificador + "\n";
                    }
                    case Longitud, Cerrar, Aleatorio, Igual, Imprimir, Pila, Principal, AbriPar, CierraPar, AbriCor, CierraCor, AbriLla, CierraLla, Agrupacion, Alias, Seleccionar, Caso, Evento, Imagen, Elipse, Fun, Coma, OtroCasoUlt, Suma, Resta, Por, Dividido, Importar, Desde -> resultado += "Es un " + tokens + "\n";
                    case Numero, Evaluar, CicloD, CicloF, OperadorRelacional, Incremento, OtroCaso, Logico, Comentario, Literal, Convertir, Funciones, Trigonometria, Acceso, Matematico, Leer, Limpia, Etiqueta, Array, Expresiones, Excepcion, EvaluacionLog, Salto, OpListas, Cadena, TerminarIns, Tipo, ComentarioEspecifico, Desplazamiento, BitAsignacion, Clonacion, Tamano, Conjunto, Flujo, Memoria, Busqueda, Archivo, Concurrencia, Sincronizacion, Mensaje, Granuladidad, Optur, Dirtur, Pentur, Rellenar -> resultado += lexer.lexeme + ": Es un " + tokens + "\n";
                    default -> resultado += "Token: " + tokens + "\n";
                }
            }
        } catch (IOException ex) {
        }
    }
}

// Clase TablaSimbolos
class TablaSimbolos {
    private final Map<String, Integer> tabla = new HashMap<>();
    private int contador = 0;

    public int obtenerNumeroIdentificador(String identificador) {
        if (!tabla.containsKey(identificador)) {
            tabla.put(identificador, contador++);
        }
        return tabla.get(identificador);
    }
}
