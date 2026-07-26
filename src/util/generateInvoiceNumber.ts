import { prisma } from "../../lib/prisma";


export async function generateInvoiceNumber() {
  const now = new Date();

  const year = now.getFullYear();
  const month = String(now.getMonth() + 1).padStart(2, "0");

  const prefix = `INV-${year}${month}`;

  const last = await prisma.invoice.findFirst({
    where: {
      invoiceNumber: {
        startsWith: prefix,
      },
    },
    orderBy: {
      invoiceNumber: "desc",
    },
  });

  let sequence = 1;

  if (last) {
    const lastSeq = Number(last.invoiceNumber.split("-").pop());
    sequence = lastSeq + 1;
  }

  return `${prefix}-${String(sequence).padStart(5, "0")}`;
}