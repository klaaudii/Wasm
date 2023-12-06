package org.example;

import de.inetsoftware.jwebassembly.api.annotation.Export;

public class Second {

    @Export(name = "second")
    public static int main() {
        return 22;
    }
}
