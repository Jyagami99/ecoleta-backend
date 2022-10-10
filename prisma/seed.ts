import prisma from "../src/database/prisma";

async function main() {
  await prisma.item.createMany({
    data: [
      { title: "Lâmpadas", image: "lampadas.svg" },
      { title: "Pilhas e Baterias", image: "baterias.svg" },
      { title: "Papéis e Papelão", image: "papeis-papelao.svg" },
      { title: "Resíduos Eletrônicos", image: "eletronicos.svg" },
      { title: "Resíduos Orgânicos", image: "organicos.svg" },
      { title: "Óleo de Cozinha", image: "oleo.svg" },
    ],
    skipDuplicates: true,
  });
}

main()
  .catch((e) => {
    console.log(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
