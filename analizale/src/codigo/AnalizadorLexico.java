package codigo;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.StringReader;
import java.util.HashMap;
import java.util.Map;
import java_cup.runtime.Symbol;

public class AnalizadorLexico {

    public static void main(String[] args) throws IOException {
        String rutaArchivo = "C:\\Users\\poky9\\Documents\\NetBeansProjects\\analizale\\src\\codigo\\analiza.txt";
        
        TablaSimbolos tablaSimbolos = new TablaSimbolos();
        
        int cont = 1;

        try (BufferedReader br = new BufferedReader(new FileReader(rutaArchivo))) {
            String line;
            String resultado = "LINEA " + cont + "\t\tSIMBOLO\n";
            while ((line = br.readLine()) != null) {
                Lexer lexer = new Lexer(new StringReader(line));
                Tokens token = lexer.yylex();
                while (token != null) {
                    switch (token) {
                        case Longitud, Cerrar, Aleatorio, Imprimir, Pila, Igual, Principal, AbriPar, CierraPar, AbriCor, CierraCor, AbriLla, CierraLla, Agrupacion, Alias, Seleccionar, Evento, Imagen, Elipse, Fun, Coma, OtroCasoUlt, Suma, Resta, Por, Dividido, Caso, Importar, Desde -> resultado += token + " \n";
                        case Numero, Evaluar, CicloD, CicloF, Incremento, OperadorRelacional, Literal, OtroCaso, Logico, Comentario, Convertir, Funciones, Trigonometria, Acceso, Matematico, Leer, Limpia, Etiqueta, Array, Expresiones, Excepcion, EvaluacionLog, Salto, OpListas, Cadena, TerminarIns, Tipo, ComentarioEspecifico, Desplazamiento, BitAsignacion, Clonacion, Tamano, Conjunto, Flujo, Memoria, Busqueda, Archivo, Concurrencia, Sincronizacion, Mensaje, Granuladidad, Optur, Dirtur, Pentur, Rellenar -> resultado += token + "\t\t" + "  < " + lexer.lexeme + " >\n";
                        case Identificador -> {
                            String identificador = lexer.lexeme;
                            int numeroIdentificador = tablaSimbolos.obtenerNumeroIdentificador(identificador);
                            resultado += token + "\t\t" + numeroIdentificador + "\n";
                        }
                        case ERROR -> resultado += "Simbolo no definido\n";
                        default -> resultado += "  < " + lexer.lexeme + " >\n";
                    }
                    token = lexer.yylex();
                }
                cont++;
                resultado += "LINEA " + cont + "\n";
            }
            System.out.println(resultado);
        }
        
        StringBuilder contenidoArchivo = new StringBuilder();
        try (BufferedReader br = new BufferedReader(new FileReader(rutaArchivo))) {
            String line;
            while ((line = br.readLine()) != null) {
                contenidoArchivo.append(line).append("\n");
            }
        } catch (IOException e) {
        }
        String ST = contenidoArchivo.toString();

        Sintax s = new Sintax(new codigo.Cup(new StringReader(ST)));

        try {
            s.parse();
            System.out.println("Análisis realizado correctamente");
        } catch (Exception ex) {
            Symbol sym = s.getS();
            System.out.println("No está bien en linea " + (sym.right + 1) + " columna: " + (sym.left + 1) + ", Texto: \"" + sym.value + "\"");
        }
    }
}

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