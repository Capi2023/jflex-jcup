package codigo;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class Principal {
    public static void main(String[] args) throws Exception{
        String ruta1 = "C:\\Users\\poky9\\Documents\\NetBeansProjects\\analizale\\src\\codigo\\Lexer.flex";
        String ruta2 = "C:\\Users\\poky9\\Documents\\NetBeansProjects\\analizale\\src\\codigo\\Cup.flex";
        String[] rutaS = {"-parser", "Sintax", "C:\\Users\\poky9\\Documents\\NetBeansProjects\\analizale\\src\\codigo\\Sin.cup"};
        generar(ruta1, ruta2, rutaS);
    }
    public static void generar(String ruta1, String ruta2, String[] rutaS) throws IOException, Exception{
        File archivo;
        archivo = new File(ruta1);
        JFlex.Main.generate(archivo);
        archivo = new File(ruta2);
        JFlex.Main.generate(archivo);
        java_cup.Main.main(rutaS);
        
        Path rutaSym = Paths.get("C:\\Users\\poky9\\Documents\\NetBeansProjects\\analizale/src\\codigo\\sym.java");
        if (Files.exists(rutaSym)) {
            Files.delete(rutaSym);
        }
        Files.move(
                Paths.get("C:\\Users\\poky9\\Documents\\NetBeansProjects\\analizale\\sym.java"), 
                Paths.get("C:\\Users\\poky9\\Documents\\NetBeansProjects\\analizale\\src/codigo\\sym.java")
        );
        Path rutaSin = Paths.get("C:\\Users\\poky9\\Documents\\NetBeansProjects\\analizale\\src\\codigo\\Sintax.java");
        if (Files.exists(rutaSin)) {
            Files.delete(rutaSin);
        }
        Files.move(
                Paths.get("C:\\Users\\poky9\\Documents\\NetBeansProjects\\analizale\\Sintax.java"), 
                Paths.get("C:\\Users\\poky9\\Documents\\NetBeansProjects\\analizale\\src/codigo\\Sintax.java")
        );
    }
}